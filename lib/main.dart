import 'package:eapp/auth/auth.dart';
import 'package:eapp/firebase_options.dart';
import 'package:eapp/models/course.dart';
import 'package:eapp/pages/bottom_bar.dart';
import 'package:eapp/pages/cart_page.dart';
import 'package:eapp/pages/course_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.light,
      home: BottomNav(),
      routes: {
        '/shop_page': (context) => CoursePage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
