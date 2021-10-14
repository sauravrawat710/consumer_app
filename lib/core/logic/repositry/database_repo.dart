import 'package:consumer_app/core/datamodel/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consumer_app/core/datamodel/profile.dart';

class DataBaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //final CollectionReference postsCollectionRef = _db.collection('Posts');

  //Future<Either<List<Post>,string>> getAllPosts()async{}
  Future getAllPosts() async {
    try {
      var postsQuerySnapShot = await _db.collection('Posts').get();
      return postsQuerySnapShot.docs
          .map((e) => Post.fromMap(e.data() as Map<String, dynamic>));
    } catch (e) {
      print(e.toString());
    }
  }

  Future addPost(Post post) async {
    try {
      //TODO : change updating PID later according to document name
      //  to genrating documentname(or PID) and then set the PID
      //  field and document name accordingly
      await _db.collection('Posts').add(post.toMap()).then((docref) {
        docref.update({'PID': docref.id});
      });
    } catch (e) {
      print(e.toString());
    }
    //  try {} catch (e) {
    //   print(e.toString());
    // }
  }

  Future getProfile(String profileID) async {
    try {
      DocumentSnapshot profileSnapshot =
          await _db.collection('Profiles').doc(profileID).get();
      return Profile.fromMap(profileSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addProfile(Profile profileToAdd) async {
    try {
      await _db.collection('Profiles').add(profileToAdd.toMap()).then((docref) {
        docref.update({'profileID': docref.id});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // List<Post> getAllPosts() {
  //   List<Post> f = [];
  //   return f;
  // }
}
