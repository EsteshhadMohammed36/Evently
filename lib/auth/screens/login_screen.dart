import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/register_screen.dart';
import 'package:event_planning/auth/widgets/custom_elevated_button.dart';
import 'package:event_planning/auth/widgets/custom_text_form_field.dart';
import 'package:event_planning/auth/widgets/evently_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context)!.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EventlyLogo(),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().length < 5)
                        return "Invalid Email";
                      return null;
                    },
                    hintText: "Email",
                    controller: emailController,
                    prefixIconPath: "assets/images/email_icon.png",
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().length < 8)
                        return "Password cannot be less than 8";
                      return null;
                    },
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                    prefixIconPath: "assets/images/password_icon.png",
                  ),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: login,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ?",
                        style: textTheme.bodySmall!
                            .copyWith(color: AppTheme.blackColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.routeName);
                          },
                          child: Text("Create Account"))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        "Or",
                        style: textTheme.bodyMedium,
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "Login With Google",
                    isGoogle: true,
                    backgroundColor: AppTheme.white,
                    foregroundColor: AppTheme.primary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      //login logic
    }
  }
}
