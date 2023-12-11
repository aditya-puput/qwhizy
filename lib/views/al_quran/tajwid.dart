import 'package:flutter/material.dart';
import 'package:mdaq/common/enum/tab_state.dart';
import 'package:mdaq/common/http/tajwid.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/simple_list.dart';
import 'package:mdaq/common/widgets/top_bar.dart';

class Tajwid extends StatefulWidget {
  const Tajwid({super.key});

  @override
  State<Tajwid> createState() => _TajwidState();
}

class _TajwidState extends State<Tajwid> {
  @override
  void initState() {
    super.initState();
    getTajwid(context, refresh);
  }

  void refresh() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFD4E1F2),
          gradient: darkMode
              ? const LinearGradient(
                  colors: [
                    Color(0xFF0F2C48),
                    Color(0xFF122447),
                    Color(0xFF040E31),
                    Color(0xFF071336)
                  ],
                  stops: [0.0, 0.25, 0.75, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const TopBar(),
            Container(
              margin: const EdgeInsets.only(top: 100),
              height: 280,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Daftar Tajwid',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    'assets/icons/tajwid.png',
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 340),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 750,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F6FB),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: darkMode
                        ? const LinearGradient(
                            colors: [
                              Color(0xFF122447),
                              Color(0xFF040E31),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, -1),
                      ),
                    ],
                  ),
                  child: SimpleList(state: TabState.tajwid, data: tajwid),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
