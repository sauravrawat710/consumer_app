import 'package:consumer_app/core/utlis/global.dart';
import 'package:flutter/material.dart';

class Post {
  final String? PID;
  final String photoURL;
  final String? authorUID;
  final String authorDPURL;
  final String createTimeStamp;
  final postCat cat;

  Post({
    @required this.PID = "",
    @required this.photoURL = "",
    @required this.authorUID = "",
    @required this.authorDPURL = "",
    @required this.createTimeStamp = "",
    @required this.cat = postCat.services,
  });

  factory Post.fromMap(Map data) {
    return Post(
        PID: data['PID'],
        photoURL: data['photoURL'],
        authorUID: data['authorUID'],
        authorDPURL: data['authorDPURL'],
        createTimeStamp: data['createTimeStamp'],
        cat: postCat.values[data['cat']]);
  }

  const Post.empty({
    this.PID = "",
    this.photoURL = "",
    this.authorUID = "",
    this.authorDPURL = "",
    this.createTimeStamp = "",
    this.cat = postCat.services,
  });

  // const Post.empty() {

  //       PID: "",
  //       photoURL: "",
  //       authorUID: "",
  //       authorDPURL: "",
  //       createTimeStamp: DateTime.now(),
  //       cat: postCat.all
  // }

  Map<String, dynamic> toMap() {
    return {
      'PID': PID,
      'photoURL': photoURL,
      'authorUID': authorUID,
      'authorDPURL': authorDPURL,
      'createTimeStamp': createTimeStamp,
      'cat': cat.index
    };
  }
}
