import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatelessWidget {
  // Function to handle logout
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Redirect to login page or wherever you deem appropriate after logout
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Log Out',
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome, Admin!"),
      ),
    );
  }
}
