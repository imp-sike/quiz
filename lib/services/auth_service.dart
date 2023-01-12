import 'package:firebase_auth/firebase_auth.dart';

// This will hold all the authentication details exposing only certain abstract methods
abstract class AuthService {
  bool? isSuccessful;
  Future<UserCredential?>? loginUser(
      {required String email, required String password});
  Future<void>? logOutUser();
}

// for handling authentication via firebase
class FirebaseAuthService extends AuthService {
  @override
  Future<void>? logOutUser() async {
    return await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential?>? loginUser(
      {required String email, required String password}) async {
    UserCredential? userCredential;
    isSuccessful = true;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      isSuccessful = false;
    }
    return userCredential;
  }
}
