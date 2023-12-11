import 'package:flutter/material.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/widgets/top_bar.dart';
import 'package:mdaq/common/widgets/user_exp.dart';

class QuizTopBar extends StatefulWidget {
  final String title;
  final String subTitle;
  final double height;
  final Widget content;
  final bool topBar;
  const QuizTopBar(
      {super.key,
      required this.title,
      this.subTitle = '',
      this.height = 280,
      this.topBar = true,
      required this.content});

  @override
  State<QuizTopBar> createState() => _QuizTopBarState();
}

class _QuizTopBarState extends State<QuizTopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: widget.topBar, child: const TopBar()),
        Container(
          margin: EdgeInsets.only(top: widget.topBar ? 10 : 65),
          height: widget.height,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(widget.title,
                  style: AppFontStyle.boldText.copyWith(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 28,
                      height: .1)),
              const SizedBox(
                height: 16,
              ),
              Text(widget.subTitle,
                  style: AppFontStyle.normalText.copyWith(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      height: .1)),
              Container(
                margin: const EdgeInsets.only(top: 4, left: 12, right: 12),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
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
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 24,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 12),
                                    child: UserEXP(
                                      progress:
                                          (user.exp / user.maxExp).toDouble(),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/level.png',
                                          width: 22,
                                        ),
                                        Text(
                                          '${user.level}',
                                          style: AppFontStyle.boldText.copyWith(
                                            color: const Color(0xFF0F6EDE),
                                            height: 1.8,
                                            fontSize:
                                                user.level >= 100 ? 10 : 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      '${user.exp}/${user.maxExp}',
                                      style: AppFontStyle.boldText.copyWith(
                                        color: Colors.white,
                                        height: 2,
                                        fontSize: user.level >= 100 ? 10 : 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 2, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/icons/coin.png',
                                width: 28,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                summarizeDigits(user.coin),
                                style: AppFontStyle.normalText.copyWith(
                                  height: 1.4,
                                  fontSize: 15,
                                  color: darkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              widget.content
            ],
          ),
        ),
      ],
    );
  }
}
