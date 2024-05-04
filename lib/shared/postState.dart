import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class PostState extends StatefulWidget {
  int numLikes;
  int numComments;

  PostState(
      {super.key, required context, required this.numLikes, required this.numComments});
  @override
  State<PostState> createState() => _PostStateState();
}

class _PostStateState extends State<PostState> {
  bool _isFavorite = false;
  final String shareContent = 'Post URL...';

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (_isFavorite) {
      // Perform action when favorited
      _showFavoriteNotification();
    }
  }

  void _showFavoriteNotification() {
    // Show a notification or perform any action to indicate that the item is favorited
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to favorites!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.numLikes} likes',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: HexColor("#00347D"))),
              Text('${widget.numComments} Comments',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: HexColor("#00347D")))
            ],
          ),
          const Divider(
            thickness: 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite
                          ? Colors.red
                          : HexColor("#00347D"), // Change color if favorited
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                        if (_isFavorite == true) {
                          widget.numLikes += 1;
                        } else {
                          widget.numLikes -= 1;
                        }
                      });
                    },
                  ),
                  Text(
                    'Like',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: HexColor("#00347D")),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment, color: HexColor("#00347D")),
                  Text(
                    'Comment',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: HexColor("#00347D")),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // Share.share(shareContent);
                      },
                      icon: const Icon(Icons.share),
                      color: HexColor("#00347D")),
                  Text(
                    'Share',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: HexColor("#00347D")),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
