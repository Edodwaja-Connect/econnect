import 'package:eapp/admin/admin_homepage.dart';
import 'package:eapp/auth/login_or_register.dart';
import 'package:eapp/pages/bottom_bar.dart';
import 'package:eapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);

        // user is logged in
        if (snapshot.hasData) {
          if (snapshot.data?.email == "admin@gmail.com") return AdminHomepage();
          return BottomNav();
        }

        // user is not logged in
        else {
          return LoginOrRegisterPage();
        }
      },
    );
  }
}
