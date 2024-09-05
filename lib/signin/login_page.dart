import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'register_page.dart'; // Ensure this is linked to your actual registration page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'student'; // Default role

  Future<void> _signIn() async {
    try {
      // Admin credentials for quick login (not recommended for production)
      const adminEmail = 'admin@gmail.com';
      const adminPassword = 'admin123';
      if (_emailController.text == adminEmail &&
          _passwordController.text == adminPassword) {
        Navigator.pushReplacementNamed(context, '/adminHomepage');
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      String uid = userCredential.user!.uid;

      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

      String role = data?['role'] ?? '';
      if (role != _selectedRole) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect role selected for this account')),
        );
        return;
      }

      // Directly navigate to tutor dashboard if role is tutor
      if (role == 'tutor') {
        Navigator.pushReplacementNamed(context, '/tutorDashboard');
        return;
      }

      // Check if the profile is completed for students
      bool isProfileComplete = ['education', 'interests', 'skills'].every(
          (field) => data?.containsKey(field) == true && data?[field] != null);

      if (!isProfileComplete) {
        Navigator.pushReplacementNamed(context, '/profileForm');
      } else {
        Navigator.pushReplacementNamed(context, '/studentDashboard');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            DropdownButton<String>(
              value: _selectedRole,
              items: [
                DropdownMenuItem(value: 'student', child: Text('Student')),
                DropdownMenuItem(value: 'tutor', child: Text('Tutor')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
