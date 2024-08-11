import 'package:eapp/styles/styles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Course Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: Colors.blueGrey,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "UI/UX Design",
              style: BoldHeading.nameOfTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Get a job in UX and build your user research and UX design skills with this hands-on user experience training course. Read More",
              style: LightText.nameOfTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lessons",
              style: BoldHeading.nameOfTextStyle,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text(
                    "UI/UX Design Introduction",
                    style: LightText.nameOfTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text(
                    "Design Thinking",
                    style: LightText.nameOfTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
