import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final InputDecoration? customDecoration;
  final VoidCallback? onEditingComplete;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
    this.customDecoration,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus(); // Hide keyboard on tap outside
      },
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: controller ?? TextEditingController(),
        focusNode: focusNode ?? FocusNode(),
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.done,
        obscureText: obscureText,
        maxLength: maxLength,
        maxLines: maxLines,
        onChanged: onChanged ?? (value) {},
        onTap: onTap ?? () {},
        validator: validator ?? (value) => null,
        onEditingComplete: onEditingComplete ?? () {},
        decoration: customDecoration ?? InputDecoration(
          labelText: labelText ?? "Label",
          hintText: hintText ?? "Enter text",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}