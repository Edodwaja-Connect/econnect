import 'package:eapp/models/course_model.dart';
import 'package:eapp/provider/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class CourseFormPage extends StatefulWidget {
  final Course? course;

  const CourseFormPage({Key? key, this.course}) : super(key: key);

  @override
  _CourseFormPageState createState() => _CourseFormPageState();
}

class _CourseFormPageState extends State<CourseFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;
  late TextEditingController _priceController;
  late TextEditingController _tutorNameController;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.course?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.course?.description ?? '');
    _durationController =
        TextEditingController(text: widget.course?.duration ?? '');
    _priceController =
        TextEditingController(text: widget.course?.price.toString() ?? '');
    _tutorNameController =
        TextEditingController(text: widget.course?.tutorName ?? '');
    _imageUrl = widget.course?.imageUrl;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  void _saveCourse() {
    if (_formKey.currentState!.validate()) {
      final newCourse = Course(
        id: widget.course?.id ?? DateTime.now().toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrl ?? '',
        duration: _durationController.text,
        price: double.parse(_priceController.text),
        tutorName: _tutorNameController.text,
        isApproved: widget.course?.isApproved ?? false,
      );

      if (widget.course == null) {
        Provider.of<CourseProvider>(context, listen: false)
            .addCourse(newCourse);
      } else {
        Provider.of<CourseProvider>(context, listen: false)
            .editCourse(newCourse);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course == null ? 'Create Course' : 'Edit Course'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'This field cannot be empty' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value!.isEmpty ? 'This field cannot be empty' : null,
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Duration'),
                validator: (value) =>
                    value!.isEmpty ? 'This field cannot be empty' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) =>
                    value!.isEmpty ? 'This field cannot be empty' : null,
              ),
              TextFormField(
                controller: _tutorNameController,
                decoration: InputDecoration(labelText: 'Tutor Name'),
                validator: (value) =>
                    value!.isEmpty ? 'This field cannot be empty' : null,
              ),
              if (_imageUrl != null) Image.network(_imageUrl!),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              ElevatedButton(
                onPressed: _saveCourse,
                child: Text('Save Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
