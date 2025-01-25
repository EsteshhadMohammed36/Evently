import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/login_screen.dart';
import 'package:event_planning/widgets/custom_elevated_button.dart';
import 'package:event_planning/widgets/custom_text_form_field.dart';
import 'package:event_planning/widgets/evently_logo.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var textTheme = Theme.of(context)!.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EventlyLogo(),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: NameController,
                    prefixIconPath: "assets/images/profile_icon.png",
                  ),
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
                    text: "Create Account",
                    onPressed: createAccount,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ?",
                        style: textTheme.bodySmall!
                            .copyWith(color: AppTheme.blackColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: Text("Login"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      //login logic
    }
  }
}
