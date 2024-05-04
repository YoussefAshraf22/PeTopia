import 'package:flutter/material.dart';
import 'package:zootopia/models/post_model.dart';

class PostContainer extends StatefulWidget {
  final Function(PostModel) onPost;
  const PostContainer({super.key, required this.onPost});

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  final TextEditingController _textEditingController = TextEditingController();
  String _postText = 'test';
  final List<String> _images = [];
  final String _videoUrl = '';
  final String _location = '';

  void _addImage() {
    // Logic to add image from gallery or camera
    setState(() {
      // Add image to _images list
    });
  }

  void _addVideo() {
    // Logic to add video from gallery or camera
    setState(() {
      // Set _videoUrl with video URL
    });
  }

  void _addLocation() {
    // Logic to fetch user's current location
    setState(() {
      // Set _location with location data
    });
  }

  // void _post() {
  //   // Logic to post the content to the server
  //   // You can send _postText, _images, _videoUrl, _location to the server
  //   // Reset all fields after posting
  //   setState(() {
  //     _textEditingController.clear();
  //     _postText = '';
  //     _images.clear();
  //     _videoUrl = '';
  //     _location = '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/woman.png'),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        setState(() {
                          _postText = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'What\'s on your mind?',
                          border: InputBorder.none),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
            if (_images.isNotEmpty)
              Column(
                children: _images.map((image) => Image.network(image)).toList(),
              ),
            if (_videoUrl.isNotEmpty) VideoPlayerWidget(videoUrl: _videoUrl),
            if (_location.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(_location),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.photo,
                              color: Colors.green,
                            ),
                            onPressed: _addImage,
                          ),
                          const Text('Photo'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.videocam,
                          color: Colors.blue,
                        ),
                        onPressed: _addVideo,
                      ),
                      const Text('Video'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        onPressed: _addLocation,
                      ),
                      const Text(
                        'Location',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 35,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 192, 113, 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: MaterialButton(
                        onPressed: () {
                          widget.onPost(
                            PostModel(
                              userName: 'User',
                              time: 'Just Now',
                              content: _postText,
                              userImg: 'assets/images/woman.png',
                              likes: 0,
                              comments: 0,
                            ),
                          );
                          _textEditingController.clear();
                        },
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Implement your video player widget here
        );
  }
}
