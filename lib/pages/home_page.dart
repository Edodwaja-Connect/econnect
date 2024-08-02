import 'package:eapp/components/text_field.dart';
import 'package:eapp/styles/app_textstyles.dart';
import 'package:eapp/styles/styles.dart';
import 'package:eapp/widgets/catagory_widget.dart';
import 'package:eapp/widgets/teacher_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      // drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey,Sukruth", style: BoldText.nameOfTextStyle),
                      Text(
                        "Good Morning",
                        style: LightText.nameOfTextStyle,
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Search',
              //     filled: true,
              //     fillColor: Colors.white,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[500]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: BoldHeading.nameOfTextStyle,
                  ),
                  Text(
                    "See all",
                    style: LightText.nameOfTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              CategoryWidget(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Teachers",
                    style: BoldHeading.nameOfTextStyle,
                  ),
                  Text(
                    "See all",
                    style: LightText.nameOfTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // TeacherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
