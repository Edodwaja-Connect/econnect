import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<bool> isProfileComplete(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;
      return data != null && data['profileComplete'] == true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      bool complete = await isProfileComplete(userCredential.user!.uid);
      if (!complete) {
        throw FirebaseAuthException(
          code: "profile-incomplete",
          message: "Profile is incomplete.",
        );
      }
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> register(String email, String password, String role) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Assume user's profile is not complete upon registration
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email,
        'role': role,
        'profileComplete': false, // Indicates the profile is not complete
      });

      notifyListeners();
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
