import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<Exception, UserCredential>> signIn({
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
      throw Left(Exception(e.message));
    }
  }

  Future<Either<Exception, UserCredential>> signUp({
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
      throw Left(Exception(e.message));
    }
  }
}
