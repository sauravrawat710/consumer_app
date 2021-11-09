import 'package:consumer_app/core/datamodel/enduser.dart';
import 'package:consumer_app/core/datamodel/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consumer_app/core/datamodel/profile.dart';
import 'package:consumer_app/core/utlis/failure.dart';
import 'package:either_dart/either.dart';

class DataBaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //final CollectionReference postsCollectionRef = _db.collection('Posts');

  //Future<Either<List<Post>,string>> getAllPosts()async{}
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      var postsQuerySnapShot = await _db.collection('Posts').get();
      return Right(postsQuerySnapShot.docs
          .map((e) => Post.fromMap(e.data() as Map<String, dynamic>))
          .toList());
    } catch (e) {
      print(e.toString());
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future addPost(Post post) async {
    try {
      //TODO : change updating PID later according to document name
      //  to genrating documentname(or PID) and then set the PID
      //  field and document name accordingly
      String? pidl;
      await _db.collection('Posts').add(post.toMap()).then((docref) async {
        pidl = docref.id;
        await docref.update({'PID': docref.id});
      });
      await _db.collection('Profiles').doc(post.authorUID).update({
        'data': FieldValue.arrayUnion([pidl])
      });
    } catch (e) {
      print(e.toString());
    }
    //  try {} catch (e) {
    //   print(e.toString());
    // }
  }

  Future<Either<Failure, Profile>> getProfile(String profileID) async {
    try {
      DocumentSnapshot profileSnapshot =
          await _db.collection('Profiles').doc(profileID).get();
      return Right(
          Profile.fromMap(profileSnapshot.data() as Map<String, dynamic>));
    } catch (e) {
      print(e.toString() + " haha");
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future addProfile(Profile profileToAdd) async {
    try {
      await _db
          .collection('Profiles')
          .doc(profileToAdd.profileID)
          .set(profileToAdd.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<Either<Failure, EndUser>> getUser(String uid) async {
  //   try {
  //     DocumentSnapshot userDocRef =
  //         await _db.collection('Users').doc(uid).get();
  //     return Right(EndUser.fromMap(userDocRef.data() as Map<String, dynamic>));
  //   } catch (e) {
  //     return Left(Failure(errorMessage: e.toString()));
  //   }
  // }
  Future getUser(String uid) async {
    try {
      DocumentSnapshot userDocRef =
          await _db.collection('Users').doc(uid).get();
      return EndUser.fromMap(userDocRef.data() as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addUser(EndUser userToAdd) async {
    try {
      await _db
          .collection('Users')
          .doc(userToAdd.userID)
          .set(userToAdd.toMap());
    } catch (e) {
      print(e.toString());
    }
  }
}
