import 'package:flutter/material.dart';
import 'package:untitled/themes/extensions.dart';

class LoginTextField extends StatelessWidget {
  final FormFieldSetter<String?> onSaved;
  final FormFieldValidator<String?> validator;
  final String? hintText;
  final bool obscureText;
  final TextStyle style;

  const LoginTextField({
    required this.onSaved,
    required this.validator,
    required this.style, super.key,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      onSaved: onSaved,
      validator: validator,
      cursorColor: context.colors.textColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        // 활성화된 상태의 Border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: context.colors.buttonColor),
        ),

        // 포커스된 상태의 Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: context.colors.onError),
        ),

        // 에러 상태의 Border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: context.colors.error),
        ),

        // 포커스된 상태에서 에러가 났을 때 Border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: context.colors.error),
        ),
      ),
    );
  }
}
