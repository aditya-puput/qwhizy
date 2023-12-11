import 'package:flutter/material.dart';
import 'package:mdaq/common/helper.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  
  bool _isAlertDialogVisible = false;

  // Function to show the AlertDialog
  void _showAlertDialog() {
    setState(() {
      _isAlertDialogVisible = true;
    });
  }

  // Function to hide the AlertDialog
  void _hideAlertDialog() {
    setState(() {
      _isAlertDialogVisible = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30, left: 16, right: 20),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/back.png',
                color: darkMode ? Colors.white : Colors.black,
                width: 28,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   darkMode = !darkMode;
                // });
              },
              child: Image.asset(
                'assets/icons/setting.png',
                color: darkMode ? Colors.white : Colors.black,
                width: 28,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ));
  }
}
