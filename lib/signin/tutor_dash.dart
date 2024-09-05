import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  final TextEditingController _tutorNameController = TextEditingController();
  final TextEditingController _tutorSubjectController = TextEditingController();
  final TextEditingController _coursePriceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadCourseData() async {
    if (_formKey.currentState!.validate()) {
      String imageUrl = '';
      if (_image != null) {
        String fileName =
            'tutor_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        Reference storageReference =
            FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = storageReference.putFile(_image!);
        await uploadTask.whenComplete(() async {
          imageUrl = await storageReference.getDownloadURL();
        });
      }

      await FirebaseFirestore.instance.collection('courses').add({
        'tutorName': _tutorNameController.text,
        'tutorSubject': _tutorSubjectController.text,
        'coursePrice': _coursePriceController.text,
        'duration': _durationController.text,
        'profileImageUrl': imageUrl,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Course added successfully!')));
      _formKey.currentState!.reset();
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.add_a_photo, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tutorNameController,
                  decoration: InputDecoration(labelText: 'Tutor Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter tutor name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tutorSubjectController,
                  decoration: InputDecoration(labelText: 'Tutor Subject'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter tutor subject';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _coursePriceController,
                  decoration: InputDecoration(labelText: 'Course Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(labelText: 'Duration'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter duration';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadCourseData,
                  child: Text('Add Course'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
