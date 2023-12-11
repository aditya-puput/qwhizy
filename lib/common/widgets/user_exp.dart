import 'package:flutter/material.dart';

class UserEXP extends StatefulWidget {
  final double progress;
  const UserEXP({super.key, required this.progress});

  @override
  State<UserEXP> createState() => _UserEXPState();
}

class _UserEXPState extends State<UserEXP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), 
            color: const Color(0xFF2A95E4), 
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: LinearProgressIndicator(
              value: widget.progress,
              backgroundColor: Colors
                  .transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF50B4FE)), 
            ),
          ),
        ),
      ],
    );
  }
}
