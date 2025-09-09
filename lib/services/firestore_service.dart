import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void createUserDocument() async {
    try {
      if(FirebaseAuth.instance.currentUser == null) {
        log('User creation failed, no user is currently signed in.');
        return;
      }
      await db.collection('prod').doc(FirebaseAuth.instance.currentUser?.uid).set({
        'email': FirebaseAuth.instance.currentUser?.email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log('User creation failed, credential.user is null.');
    }
  }

  void saveIcsUrl(String icsUrl) async {
    try {
      if(FirebaseAuth.instance.currentUser == null) {
        log('No one is signed in, cannot save .ics URL.');
        return;
      }
      await db.collection('prod').doc(FirebaseAuth.instance.currentUser?.uid).update({
        'icsUrl': icsUrl,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log('Failed to save .ics URL: $e');
    }
  }
}