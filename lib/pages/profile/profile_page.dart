import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zootopia/pages/profile/edit_profile.dart';
import 'package:zootopia/shared/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //dark mood
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
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Youusef',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'ussef@gamil.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ));
                      },
                      child: const Text(
                        'Edite',
                        style: TextStyle(color: Colors.white),
                      )),
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
                  onPress: () {},
                  textColor: Colors.red,
                )
              ],
            )),
      )),
    ));
  }
}
