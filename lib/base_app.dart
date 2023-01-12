import 'package:backend_quiz/screens/auth/login_view.dart';
import 'package:backend_quiz/screens/home/home_view.dart';
import 'package:backend_quiz/screens/published/published_view.dart';
import 'package:backend_quiz/screens/quiz_add/add_quiz_view.dart';
import 'package:backend_quiz/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// All the theming will go here
// check for logged in status and divert to respective screens
class BaseApp extends ConsumerWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          color: Colors.purple,
        )),
        home: FirebaseAuth.instance.currentUser == null
            ? const LoginView()
            : const HomeView());
  }
}
