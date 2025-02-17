import 'package:event_planning/app_theme.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    required this.prefixIconPath,
    required this.controller,
    this.validator,
    required this.hintText,
    this.isPassword = false,
    this.maxLines = 1,
  });

  int maxLines;
  String? prefixIconPath;
  String hintText;
  bool isPassword;
  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObsecure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context)!.textTheme;
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          maxLines: widget.maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isObsecure,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: AppTheme.primary,
          style: themingProvider.isDark
              ? textTheme.bodySmall?.copyWith(color: AppTheme.white)
              : textTheme.bodySmall,
          decoration: InputDecoration(
            hintStyle: themingProvider.isDark
                ? textTheme.bodySmall?.copyWith(color: AppTheme.white)
                : textTheme.bodySmall,
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      isObsecure = !isObsecure;
                      setState(() {});
                    },
                    icon: isObsecure
                        ? Icon(
                            Icons.visibility,
                            color: themingProvider.isDark
                                ? AppTheme.white
                                : AppTheme.greyColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: themingProvider.isDark
                                ? AppTheme.white
                                : AppTheme.greyColor,
                          ))
                : null,
            prefixIcon: widget.prefixIconPath == null
                ? null
                : Image.asset(widget.prefixIconPath!),
          ),
        ));
  }
}
