import 'package:flutter/material.dart';

import '../../services/firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = "home"});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String icsUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (String value) {
                icsUrl = value;
              },
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Enter .ics URL',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirestoreService().saveIcsUrl(icsUrl);
              },
              child: Text('Update Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}