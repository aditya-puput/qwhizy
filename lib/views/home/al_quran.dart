import 'package:flutter/material.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/widgets/home_menu_item.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/top_bar.dart';
import 'package:mdaq/views/al_quran/al_quran_list.dart';
import 'package:mdaq/views/al_quran/bookmark.dart';
import 'package:mdaq/views/al_quran/reminder.dart';
import 'package:mdaq/views/al_quran/tajwid.dart';

class AlQuran extends StatefulWidget {
  const AlQuran({super.key});

  @override
  State<AlQuran> createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
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
                  Text('Al Quran',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  Image.asset(
                    'assets/icons/al_quran.png',
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                  Text('Last Read',
                      style: AppFontStyle.normalText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 12,
                          height: 1.4)),
                  Text('Al-Insan',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          height: 1.1)),
                  Text('Ayat 3',
                      style: AppFontStyle.normalText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 12,
                          height: 1.4)),
                  Text('Madiniyah | Surah 76 | Juz 29',
                      style: AppFontStyle.normalText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 12,
                          height: 1.4)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 380),
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
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 21
                        ),
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: GridView.count(
                          padding: const EdgeInsets.all(8),
                          crossAxisCount: 2,
                          crossAxisSpacing: 45,
                          mainAxisSpacing: 24,
                          childAspectRatio: 1.0,
                          children: const [
                            HomeMenuItem(
                              icon: "al_quran2.png",
                              name: "Al-Quran",
                              navigation: AlQuranList(),
                              colors: [
                                Color(0xFF3CEAC1),
                                Color(0xFF00C0DA),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "reminder.png",
                              name: "Pengingat",
                              navigation: Reminder(),
                              colors: [
                                Color(0xFF74B5ED),
                                Color(0xFF0A75D1),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "tajwid.png",
                              name: "Daftar Tajwid",
                              navigation: Tajwid(),
                              colors: [
                                Color(0xFFEFCF42),
                                Color(0xFFE59700),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "bookmark.png",
                              name: "Penanda",
                              navigation: Bookmark(),
                              colors: [
                                Color(0xFFD0B0F1),
                                Color(0xFFA468E1),
                              ],
                            ),
                            SizedBox(),
                            SizedBox(),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
