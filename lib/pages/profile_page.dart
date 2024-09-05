import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser; // Get the current logged-in user
  }

  void _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context)
        .pushReplacementNamed('/login'); // Redirect to login page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: user == null
          ? Center(child: Text("No user logged in."))
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('profiles')
                  .where('userId', isEqualTo: user!.uid) // Filter by user ID
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                var documents = snapshot.data!.docs;
                if (documents.isEmpty) {
                  return Center(
                      child: Text(
                          "Profile not found. Please complete your profile."));
                }

                var data = documents.first.data() as Map<String, dynamic>;
                return ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text(data['education']),
                      subtitle: Text('Education'),
                    ),
                    ListTile(
                      leading: Icon(Icons.interests),
                      title: Text(data['interests']),
                      subtitle: Text('Interests'),
                    ),
                    ListTile(
                      leading: Icon(Icons.table_bar),
                      title: Text(data['skills']),
                      subtitle: Text('Skills'),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
