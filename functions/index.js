import { setGlobalOptions } from "firebase-functions";
import admin from "firebase-admin";
import { onRequest } from "firebase-functions/https";
import logger from "firebase-functions/logger";
import { icsToJson } from "ics-to-json";

setGlobalOptions({ maxInstances: 10 });
admin.initializeApp();

export const nightlySync = onRequest(async (req, res) => {
    const db = admin.firestore();
    logger.info("Nightly sync started", {structuredData: true});

    try {
        const snapshot = await db.collection("prod").get();

        for (const doc of snapshot.docs) {
            console.log(`Processing doc: ${doc.id}`);

            const fileLocation = doc.data().ics;
            const calendarData = await convert(fileLocation);

            const existingTasks = doc.data().tasks || [];

            const completedMap = {};
            for (const task of existingTasks) {
                const key = task.uid || (task.summary + task.startDate);
                completedMap[key] = task.completed === true;
            }

            for (const task of calendarData) {
                const key = task.uid || (task.summary + task.startDate);
                task.completed = completedMap[key] === true ? true : false;
            }

            await db.collection("prod").doc(doc.id).update({ tasks: calendarData });
        }

        res.send(`Processed ${snapshot.size} documents in 'prod'`);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error processing prod documents");
    }
});

const convert = async (fileLocation) => {
    const icsRes = await fetch(fileLocation);
    const icsData = await icsRes.text();

    const data = icsToJson(icsData);
    return data;
};