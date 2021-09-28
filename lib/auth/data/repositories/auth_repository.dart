import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<Exception, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right('Signed In');
    } on FirebaseAuthException catch (e) {
      throw Left(Exception(e.message));
    }
  }

  Future<Either<Exception, String>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right('Signed up');
    } on FirebaseAuthException catch (e) {
      throw Left(Exception(e.message));
    }
  }
}
