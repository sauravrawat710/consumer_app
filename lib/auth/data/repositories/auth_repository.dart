import 'dart:io';

import 'package:consumer_app/core/datamodel/enduser.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/utlis/active_user.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utlis/failure.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DataBaseService _dbService = GetIt.instance.get<DataBaseService>();

  EndUser? _activeUser;
  EndUser? get activeUser => _activeUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential _credentials =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await GetIt.instance
          .get<ActiveUser>()
          .populateActiveUser(_firebaseAuth.currentUser!.uid);
      return Right(_credentials);
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      return Left(
        Failure(errorType: Error.dialog, errorMessage: e.message!),
      );
    } on SocketException {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential _credentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _dbService.addUser(EndUser(
          userID: _firebaseAuth.currentUser!.uid,
          userDPURL: "https://loremflickr.com/40/40",
          userType: "merchant",
          username: "Deluxe Pet Care"));
      await GetIt.instance
          .get<ActiveUser>()
          .populateActiveUser(_firebaseAuth.currentUser!.uid);
      return Right(_credentials);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(errorType: Error.dialog, errorMessage: e.message!),
      );
    } on SocketException {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
