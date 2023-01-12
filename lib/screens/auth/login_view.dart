import 'package:backend_quiz/components/buttons/basic_buttons.dart';
import 'package:backend_quiz/components/extensions/string_extensions.dart';
import 'package:backend_quiz/components/inputs/text_inputs.dart';
import 'package:backend_quiz/screens/auth/login_vm.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginViewModel = ChangeNotifierProvider<LoginViewModel>((ref) {
  return LoginViewModel();
});

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoggingIn = ref.watch(loginViewModel).isLoggingIn;

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Row(children: [
        Container(
          width: 0.5 * MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff2c59c0),
          child: Image.asset(
            "assets/img_auth.gif",
            width: 0.2 * MediaQuery.of(context).size.width,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.5 * MediaQuery.of(context).size.width,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Quiz Admin Login",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    globalTextFormField(
                        controller: ref.read(loginViewModel).emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.toString().isValidEmail()) {
                            return 'Please enter valid email address';
                          }
                          return null;
                        },
                        hintText: "Input your Email Address",
                        labelText: "Email Address",
                        iconData: Icons.email),
                    globalTextFormField(
                        controller: ref.read(loginViewModel).passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                        hintText: "Input Password",
                        labelText: "Password",
                        obscureText: true,
                        iconData: Icons.security),
                    primaryButton(
                      title: "Log In",
                      onPressed: isLoggingIn
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                ref
                                    .read(loginViewModel)
                                    .loginUser(context: context);
                              }
                            },
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
