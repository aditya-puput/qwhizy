import 'package:flutter/material.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/utils/transition_shift.dart';

class HomeMenuItem extends StatefulWidget {
  final String name;
  final String icon;
  final Widget navigation;
  final List<Color> colors;
  const HomeMenuItem(
      {super.key,
      required this.name,
      required this.icon,
      required this.navigation,
      required this.colors});

  @override
  State<HomeMenuItem> createState() => _HomeMenuItemState();
}

class _HomeMenuItemState extends State<HomeMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: widget.colors,
            stops: const [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context)
                        .push(TransitionShift(child: widget.navigation));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icons/${widget.icon}"),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    widget.name,
                    style:
                        AppFontStyle.homeItemText.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
