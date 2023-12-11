import 'package:flutter/material.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.keyboardType});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 16;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: 40,
        width: double.maxFinite,
        color: darkMode ? const Color(0xFF4F4F4F).withOpacity(0.31) : const Color(0xFFFFFFFF).withOpacity(0.5),
        child: TextField(
          showCursor: true,
          cursorColor: darkMode ? Colors.white : Colors.black,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          focusNode: _focusNode,
          controller: widget.controller,
          style: AppFontStyle.authInputText
              .copyWith(color: darkMode ? Colors.white : Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 18),
            hintText: widget.hintText,
            hintStyle: AppFontStyle.authHintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: darkMode ? const Color(0xFFD9D9D9) : const Color(0xFF9EA3A2)),
                borderRadius: BorderRadius.circular(radius)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkMode ? const Color(0xFFD9D9D9) : const Color(0xFF9EA3A2)),
                borderRadius: BorderRadius.circular(radius)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
                borderRadius: BorderRadius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
