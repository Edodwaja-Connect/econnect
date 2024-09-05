import 'package:eapp/components/course_tile.dart';
import 'package:eapp/models/course.dart';
import 'package:eapp/pages/detail_page.dart';
import 'package:eapp/pages/student_form.dart';
import 'package:eapp/styles/styles.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final Products = context.watch<Shop>().shop;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Course Page"),
          actions: [
            //go to cart
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_bag_outlined))
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop title
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //shop subtitle
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("Add the Courses into the cart",
                    style: BoldHeading.nameOfTextStyle),
              ),
            ),

            //product list
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                // height: 800,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Products.length,
                    padding: const EdgeInsets.all(15),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      //get each indi product from shop
                      final Product = Products[index];

                      //return as a product tile ui
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileForm(),
                              ),
                            );
                          },
                          child: CourseTile(course: Product));
                    }),
              ),
            ),
          ],
        ));
  }
}
