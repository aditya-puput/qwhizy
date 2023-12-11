import 'package:flutter/material.dart';
import 'package:mdaq/common/data/character.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';

class CharItem extends StatefulWidget {
  final Character data;
  const CharItem({super.key, required this.data});

  @override
  State<CharItem> createState() => _CharItemState();
}

class _CharItemState extends State<CharItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Image.asset("assets/images/chars/${darkMode ? 'dark' : 'light'}_${user.chars.contains(widget.data.id) ? widget.data.frame : 'locked_char.png'}"),
          const SizedBox(height: 8,),
          Text(user.chars.contains(widget.data.id) ? widget.data.name : 'Terkunci',
              style: AppFontStyle.boldText.copyWith(
                color: user.chars.contains(widget.data.id) ? darkMode ? Colors.white : Colors.black : const Color(0xFF233256),
                fontSize: 22,
                height: 1
              ), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
