import 'package:eapp/models/course.dart';
import 'package:eapp/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseTile extends StatelessWidget {
  final Coursee course;
  const CourseTile({super.key, required this.course});

  //add to cart button
  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add this item to your cart?"),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),

                //yes button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().addToCart(course);
                  },
                  child: Text("YES"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        elevation: 7,
        child: Expanded(
          child: Container(
            height: 120,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Card(
                  color: Colors.amber,
                  child: Container(
                    width: 120,
                    child: Image.asset(course.imagePath),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: BoldHeading.nameOfTextStyle,
                      ),
                      Text(
                        course.description,
                        style: LightText.nameOfTextStyle,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                            onPressed: () => addToCart(context),
                            icon: Icon(Icons.add)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
