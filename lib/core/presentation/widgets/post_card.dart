import 'package:consumer_app/core/datamodel/post.dart';
import 'package:consumer_app/core/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class PostCardWidget extends StatelessWidget {
//   Post post;
//   bool loading = false;
//   var headerOnTap;

//   // ignore: use_key_in_widget_constructors
//   PostCardWidget({this.post = const Post.empty(), this.headerOnTap});
//   PostCardWidget.loading({this.post = const Post.empty(), this.headerOnTap})
//       : loading = true;

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Padding(
//         padding: EdgeInsets.all(5),
//         child: Row(children: [
//           GestureDetector(
//             onTap: headerOnTap(post.authorUID),
//             child: Row(
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
//                   child: loading
//                       ? CircleAvatar()
//                       : Image.network(post.authorDPURL),
//                 ),
//                 SizedBox(width: 5),
//                 Text("Deluxe ShpopCenter"),
//               ],
//             ),
//           ),
//           Expanded(child: SizedBox()),
//           Text("Time Left: 18h"),
//         ]),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: 400,
//         child: loading
//             ? CircularProgressIndicator()
//             : Image.network(post.photoURL),
//       ),
//       Row(
//         children: [
//           IconButton(icon: Icon(Icons.thumb_up_outlined), onPressed: () {}),
//           IconButton(icon: Icon(Icons.thumb_down_outlined), onPressed: () {}),
//           Expanded(child: SizedBox()),
//           //Text("rating: ${post.rating}/5.0")
//           Text("rating: 4.7/5.0")
//         ],
//       ),
//     ]);
//   }
// }

class postCardWidget extends StatelessWidget {
  final Post post;
  final bool isLoading;

  const postCardWidget({Key? key, required this.post, this.isLoading = false})
      : super(key: key);

  const postCardWidget.loading({Key? key})
      : isLoading = true,
        post = const Post.empty(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 250,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      );
    } else {
      return Column(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(children: [
            GestureDetector(
              onTap: () {
                context.read<HomeCubit>().openProfile(post.authorUID!);
              },
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(post.authorDPURL),
                  ),
                  SizedBox(width: 5),
                  Text("Deluxe ShpopCenter"),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Text("Time Left: 18h"),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Image.network(post.photoURL),
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
}
