import 'package:eapp/models/teachers_model.dart';
import 'package:eapp/styles/styles.dart';
import 'package:flutter/material.dart';

class TeacherWidget extends StatefulWidget {
  const TeacherWidget({super.key});

  @override
  State<TeacherWidget> createState() => _TeacherWidgetState();
}

class _TeacherWidgetState extends State<TeacherWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //first teacher
          Column(
            children: [
              Card(
                elevation: 7,
                child: Container(
                  height: 170,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 110,
                          width: 130,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/teachers/kranthi.webp"))),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sukruth",
                            style: BoldHeading.nameOfTextStyle,
                          ),
                          Text(
                            "Flutter",
                            style: LightText.nameOfTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //second teacher
          Column(
            children: [
              Card(
                elevation: 7,
                child: Container(
                  height: 170,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 110,
                          width: 130,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/teachers/har.webp"))),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Madhulash",
                            style: BoldHeading.nameOfTextStyle,
                          ),
                          Text(
                            "Robotics",
                            style: LightText.nameOfTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //3rd teacher
          Column(
            children: [
              Card(
                elevation: 7,
                child: Container(
                  height: 170,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 110,
                          width: 130,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/teachers/harshi.webp"))),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Surabhi",
                            style: BoldHeading.nameOfTextStyle,
                          ),
                          Text(
                            "Devops",
                            style: LightText.nameOfTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //4th teacher
          Column(
            children: [
              Card(
                elevation: 7,
                child: Container(
                  height: 170,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 110,
                          width: 130,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/teachers/papa.webp"))),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Varshini",
                            style: BoldHeading.nameOfTextStyle,
                          ),
                          Text(
                            "Design",
                            style: LightText.nameOfTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
