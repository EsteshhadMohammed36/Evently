import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/register_screen.dart';
import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/home_screen.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:event_planning/widgets/custom_elevated_button.dart';
import 'package:event_planning/widgets/custom_text_form_field.dart';
import 'package:event_planning/widgets/evently_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);
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
                        return AppLocalizations.of(context)!.invalidEmail;
                      return null;
                    },
                    hintText: AppLocalizations.of(context)!.email,
                    controller: emailController,
                    prefixIconPath: themingProvider.isDark
                        ? "assets/images/email_dark.png"
                        : "assets/images/email_icon.png",
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().length < 8)
                        return AppLocalizations.of(context)!.passCanNotBeLess8;
                      return null;
                    },
                    hintText: AppLocalizations.of(context)!.password,
                    isPassword: true,
                    controller: passwordController,
                    prefixIconPath: themingProvider.isDark
                        ? "assets/images/password_dark.png"
                        : "assets/images/password_icon.png",
                  ),
                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.login,
                    onPressed: login,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.doNotHaveAccount,
                        style: textTheme.bodySmall!.copyWith(
                            color: themingProvider.isDark
                                ? AppTheme.white
                                : AppTheme.blackColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.routeName);
                          },
                          child:
                              Text(AppLocalizations.of(context)!.createAccount))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: textTheme.bodyMedium,
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: AppLocalizations.of(context)!.loginWithGoogle,
                    isGoogle: true,
                    backgroundColor: themingProvider.isDark
                        ? AppTheme.backgroundDark
                        : AppTheme.backgroundLight,
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
      FirebaseService.login(
              email: emailController.text, password: passwordController.text)
          .then((user) {
        Provider.of<UserProvider>(context, listen: false)
            .updateCurrentUser(user);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }).catchError((error) => print(error));
    }
  }
}
