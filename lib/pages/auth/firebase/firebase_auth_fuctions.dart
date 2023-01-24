import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFunctions {
  final _firebaseAuth = FirebaseAuth.instance;

  //sign up methods
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
    }
  }

  //sign in methods
  Future<void> singinWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
    }
  }
}
