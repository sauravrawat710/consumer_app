import 'package:consumer_app/core/datamodel/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Post> getAllPosts() {
    List<Post> f = [];
    return f;
  }
}
