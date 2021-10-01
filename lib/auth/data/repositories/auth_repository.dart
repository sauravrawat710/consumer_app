import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utlis/failure.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
