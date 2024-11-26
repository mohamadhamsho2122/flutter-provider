import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ss/datatime.dart';
import 'package:ss/slider.dart';

class SlivarAppar extends StatefulWidget {
  const SlivarAppar({super.key});

  @override
  State<SlivarAppar> createState() => _selverState();
}

class _selverState extends State<SlivarAppar> {
  XFile? imageFile;

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Image Source'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () => _imageFromCamera(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });

    Navigator.pop(context);
  }

  Future _imageFromCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Color.fromARGB(193, 136, 74, 1),
            toolbarHeight: 68,
            expandedHeight: 400,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/1.jpg',
                fit: BoxFit.cover,
              ),
              title: Text(
                'pisse',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(400),
                                    bottomEnd: Radius.circular(400)),
                              ),
                            ),
                            Positioned(
                              left: 210,
                              top: 150,
                              child: CircleAvatar(
                                radius: 50,
                                child: IconButton(
                                    onPressed: () => _showOption(context),
                                    icon: Icon(Icons.camera_alt_outlined)),
                              ),
                            ),
                          ],
                        ),
                        DataTime(),
                        Center(
                          child: imageFile != null
                              ? Image.file(
                                  File(imageFile!.path),
                                  width: 400,
                                  height: 400,
                                )
                              : Text('No image selected'),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SliderScreen()));
        },
      ),
    );
  }
}
