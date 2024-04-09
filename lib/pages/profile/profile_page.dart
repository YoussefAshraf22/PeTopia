import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/profile/edit_profile.dart';
import 'package:zootopia/shared/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //dark mood
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                Stack(
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/profile_cover.webp'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Center(
                        child: SizedBox(
                          height: 150,
                          width: 150,
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
                  ],
                ),
                const Text(
                  'Youusef',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'ussef@gamil.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()));
                    },
                    child: Text('Edite',
                        style: TextStyle(
                          color: HexColor("#ed8900"),
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        )),
                  ),
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
