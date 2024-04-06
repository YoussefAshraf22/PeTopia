import 'package:flutter/material.dart';

class ShowImagePicker extends StatelessWidget {
  const ShowImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showImagePicker(
      {required BuildContext context,
      required Function imageGallery,
      required Function imageCamera}) {
    showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Colors.yellow,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    imageGallery();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Icon(Icons.photo_library_rounded, size: 25),
                        Text('Gallery', style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    imageCamera();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 25,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
