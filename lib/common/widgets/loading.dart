import 'package:flutter/material.dart';
import 'package:mdaq/common/helper.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            darkMode ? Colors.white : Colors.black),
      ),
    );
  }
}
