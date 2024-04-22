import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/profile/profile_state.dart';
import 'package:zootopia/shared/profile_menu.dart';
import 'package:zootopia/shared/show_Image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // String _name = 'Youusef';
  // String _email = 'ussef@gmail.com';
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? selectedImage;
  File? selectedCover;
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<ProfileState>(context).name;
    String email = Provider.of<ProfileState>(context).email;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Profile'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                          backgroundColor: HexColor("#00347D"),
                          radius: 18,
                          child: IconButton(
                            onPressed: () {
                              const ShowImagePicker().showImagePicker(
                                  context: context,
                                  imageCamera: pickCoverCamera,
                                  imageGallery: pickCoverGallery);
                            },
                            icon: const Icon(Icons.edit,
                                size: 18, color: Colors.white),
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
                          backgroundColor: HexColor("#00347D"),
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              const ShowImagePicker().showImagePicker(
                                  context: context,
                                  imageCamera: pickImageCamera,
                                  imageGallery: pickImageGallery);
                            },
                            icon: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ))
                  ]),
                  const SizedBox(
                    height: 25,
                  ),
                  _isEditing
                      ? Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: _saveChanges,
                                  child: const Text('Save'),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: _cancelChanges,
                                  child: const Text('Cancel'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isEditing = true;
                                  _nameController.text = name;
                                  _emailController.text = email;
                                });
                              },
                              child: const Text('Edit'),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  ProfileMenu(
                    icon: Icons.post_add,
                    title: 'Add Post',
                    onPress: () {},
                  ),
                  ProfileMenu(
                    icon: Icons.featured_play_list,
                    title: 'My Posts',
                    onPress: () {},
                  ),
                  const Divider(),
                  ProfileMenu(
                    icon: Icons.info,
                    title: 'Information',
                    onPress: () {},
                  ),
                  ProfileMenu(
                    icon: Icons.logout,
                    title: 'Logout',
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    setState(() {
      Provider.of<ProfileState>(context, listen: false).updateProfile(
        newName: _nameController.text,
        newEmail: _emailController.text,
      );
      _isEditing = false;
    });
  }

  void _cancelChanges() {
    setState(() {
      _isEditing = false;
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
}
