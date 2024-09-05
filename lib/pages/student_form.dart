import 'package:eapp/pages/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _education = '';
  String _interests = '';
  String _skills = '';

  // Dropdown items
  final List<String> _educationLevels = [
    'High School',
    'Bachelor\'s',
    'Master\'s',
    'PhD'
  ];
  final List<String> _skillsOptions = [
    'Programming',
    'Design',
    'Management',
    'Marketing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            DropdownButtonFormField(
              value: _education.isEmpty ? null : _education,
              decoration: InputDecoration(labelText: 'Education'),
              items: _educationLevels.map((String level) {
                return DropdownMenuItem(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _education = newValue!;
                });
              },
              onSaved: (value) {
                _education = value as String;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Interests'),
              onSaved: (value) {
                _interests = value!;
              },
            ),
            DropdownButtonFormField(
              value: _skills.isEmpty ? null : _skills,
              decoration: InputDecoration(labelText: 'Skills'),
              items: _skillsOptions.map((String skill) {
                return DropdownMenuItem(
                  value: skill,
                  child: Text(skill),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _skills = newValue!;
                });
              },
              onSaved: (value) {
                _skills = value as String;
              },
            ),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FirebaseFirestore.instance.collection('profiles').add({
        'education': _education,
        'interests': _interests,
        'skills': _skills,
        'userId': _auth.currentUser?.uid, // Assuming you're tracking by user ID
      }).then((value) {
        // Navigate to BottomNav upon successful profile save
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save profile: $error')),
        );
      });
    }
  }
}
