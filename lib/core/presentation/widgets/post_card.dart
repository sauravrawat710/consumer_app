import 'package:consumer_app/core/datamodel/post.dart';
import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  Post post;
  // ignore: use_key_in_widget_constructors
  PostCardWidget({this.post = const Post.empty()});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.all(5),
        child: Row(children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(post.authorDPURL),
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(post.authorUID),
          Expanded(child: SizedBox()),
          Text("Time Left: 18h"),
        ]),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(post.photoURL),
          ),
        ),
      ),
      Row(
        children: [
          IconButton(icon: Icon(Icons.thumb_up_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.thumb_down_outlined), onPressed: () {}),
          Expanded(child: SizedBox()),
          //Text("rating: ${post.rating}/5.0")
          Text("rating: 4.7/5.0")
        ],
      ),
    ]);
  }
}
