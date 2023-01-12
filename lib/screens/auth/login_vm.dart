import 'package:backend_quiz/screens/home/home_view.dart';
import 'package:backend_quiz/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = FirebaseAuthService();
  bool isLoggingIn = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(
      {required BuildContext context}) async {
    isLoggingIn = true;
    notifyListeners();

    await _authService
        .loginUser(email: emailController.value.text, password: passwordController.value.text)!
        .then((value) {
      if (!_authService.isSuccessful!) {
        // not successfull
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Email and Password combination not matched!"), backgroundColor: Colors.red,));
      } else {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext c) => const HomeView()));
        }
      }
      isLoggingIn = false;
      notifyListeners();
    });
  }
}
