import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/show_Image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? selectedImage;
  File? selectedCover;

  @override
  Widget build(BuildContext context) {
    String fullName = "";
    String email = "";
    String password = "";
    String? phone;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(isDark ? LineAwesome.sun : LineAwesome.moon))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            SizedBox(
                height: 180,
                width: double.infinity,
                child: selectedCover != null
                    ? Image.file(selectedCover!)
                    : Image.asset('assets/images/profile_cover.webp')),
            Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 18,
                  child: IconButton(
                    onPressed: () {
                      const ShowImagePicker().showImagePicker(
                          context: context,
                          imageCamera: pickCoverCamera,
                          imageGallery: pickCoverGallery);
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: selectedImage != null
                  ? Center(
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(selectedImage!),
                        ),
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: AssetImage(
                              'assets/images/logo2.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            Positioned(
                bottom: 8,
                right: 120,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 20,
                  child: IconButton(
                    onPressed: () {
                      const ShowImagePicker().showImagePicker(
                          context: context,
                          imageCamera: pickImageCamera,
                          imageGallery: pickImageGallery);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ))
          ]),
          const SizedBox(
            height: 25,
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    onChanged: (val) {
                      val = fullName;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text('Full Name'),
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      val = email;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text('Email'),
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      val = password;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      val = phone!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text('Phone Number'),
                        prefixIcon: const Icon(Icons.phone_iphone_rounded)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save edits',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ])),
      ),
    );
  }

  Future pickImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }

  Future pickImageCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }

  Future pickCoverGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedCover = File(returnImage.path);
    });
  }

  Future pickCoverCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedCover = File(returnImage.path);
    });
  }
}
