import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zootopia/pages/profile/profile_page.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              Center(
                child: Stack(alignment: Alignment.bottomRight, children: [
                  const CircleAvatar(
                    radius: 140,
                    child: Image(
                      image: AssetImage(
                        'assets/images/logo2.jpg',
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
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
                        height: 8,
                      ),
                      TextFormField(
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
                        height: 8,
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
                        height: 8,
                      ),
                      TextFormField(
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
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ));
                    },
                    child: const Text(
                      'Save Edites',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ])),
      ),
    );
  }
}
