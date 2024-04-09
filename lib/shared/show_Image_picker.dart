import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

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
      backgroundColor: HexColor("#00347D"),
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
                        Icon(
                          Icons.photo_library_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text('Gallery',
                            style: TextStyle(fontSize: 20, color: Colors.white))
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
                        Icon(Icons.camera_alt, size: 25, color: Colors.white),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
