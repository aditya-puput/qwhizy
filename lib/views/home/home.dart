import 'package:flutter/material.dart';
import 'package:mdaq/common/enum/home_bottom_bar_state.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/utils/transition_shift.dart';
import 'package:mdaq/common/widgets/home_bottom_bar.dart';
import 'package:mdaq/common/widgets/home_menu_item.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/views/home/al_quran.dart';
import 'package:mdaq/views/home/challenge.dart';
import 'package:mdaq/views/home/law.dart';
import 'package:mdaq/views/home/quiz.dart';
import 'package:mdaq/views/home/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Container(
              margin: const EdgeInsets.only(top: 30, left: 12, right: 12),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(TransitionShift(child: const User()));
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: user.image),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: AppFontStyle.accountNameText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            '@${user.username}',
                            style: AppFontStyle.accountUsernameText.copyWith(
                              color: darkMode
                                  ? const Color(0xFF9EA3A2)
                                  : Colors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode = !darkMode;
                        });
                      },
                      child: Image.asset(
                        'assets/icons/setting.png',
                        color: darkMode ? Colors.white : Colors.black,
                        width: 28,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              height: 240,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/chars/${user.curChar.char}',
                fit: BoxFit.cover,
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
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 21,
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
                              icon: "al_quran.png",
                              name: "Al-Quran",
                              navigation: AlQuran(),
                              colors: [
                                Color(0xFF74B5ED),
                                Color(0xFF0A75D1),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "quiz.png",
                              name: "Quiz",
                              navigation: Quiz(),
                              colors: [
                                Color(0xFFF48B58),
                                Color(0xFFBF5432),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "challenge.png",
                              name: "Tantangan",
                              navigation: Challenge(),
                              colors: [
                                Color(0xFFD0B0F1),
                                Color(0xFFA468E1),
                              ],
                            ),
                            HomeMenuItem(
                              icon: "law.png",
                              name: "Hukum Bacaan",
                              navigation: Law(),
                              colors: [
                                Color(0xFFEFCF42),
                                Color(0xFFE59700),
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
            const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeBottomBar(state: HomeBottomBarState.home)),
          ],
        ),
      ),
    );
  }
}
