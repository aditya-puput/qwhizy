import 'package:flutter/material.dart';
import 'package:mdaq/common/enum/home_bottom_bar_state.dart';
import 'package:mdaq/common/http/leaderboard.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/home_bottom_bar.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_leaderboard.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  void initState() {
    super.initState();
    getLeaderboard(context, () => refresh());
  }

  void refresh() {
    setState(() {});
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
              margin: const EdgeInsets.only(top: 65),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Peringkat',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 270,
                    width: double.infinity,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TopLeaderboard(
                              data: leaderboard[1],
                              title: "#2",
                              height: 230,
                              gradient: const [
                                Color(0xFFD0B0F1),
                                Color(0xFFA468E1)
                              ]),
                          TopLeaderboard(
                              data: leaderboard[0],
                              title: "#1",
                              height: 270,
                              gradient: const [
                                Color(0xFFEFCF42),
                                Color(0xFFE59700)
                              ]),
                          TopLeaderboard(
                              data: leaderboard[2],
                              title: "#3",
                              height: 210,
                              gradient: const [
                                Color(0xFFF48B58),
                                Color(0xFFBF5432)
                              ]),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 355),
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
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.bottomCenter,
                child: Builder(
                  builder: (context) {
                    if (leaderboard.isEmpty) {
                      return const Loading();
                    }
                    return ListView.builder(
                      itemCount: leaderboard.length - 2,
                      itemBuilder: (BuildContext context, int i) {
                        if (i == leaderboard.length - 3) {
                          return const SizedBox(
                            height: 230,
                          );
                        }
                        final item = leaderboard[i + 3];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? const Color(0xFF233256)
                                  : const Color(0xFFE7EEF8),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                color: darkMode
                                    ? const Color(0xFF3CEAC1).withOpacity(0.5)
                                    : const Color(0xFF4F4F4F).withOpacity(0.31),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 62,
                                          child: Stack(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 3,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    child: Image.asset(
                                                        "assets/images/user_default.png",
                                                        fit: BoxFit.cover)),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/level.png',
                                                      width: 22,
                                                    ),
                                                    Text(
                                                      '${item.level}',
                                                      style: AppFontStyle
                                                          .boldText
                                                          .copyWith(
                                                        color: const Color(
                                                            0xFF0F6EDE),
                                                        height: 1.8,
                                                        fontSize:
                                                            user.level >= 100
                                                                ? 10
                                                                : 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: AppFontStyle.boldText
                                                    .copyWith(
                                                  height: 1.2,
                                                  fontSize: 17,
                                                  color: darkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              Text(
                                                '@${item.username}',
                                                style: AppFontStyle.normalText
                                                    .copyWith(
                                                  height: 1.2,
                                                  fontSize: 12,
                                                  color: darkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 2, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Skor',
                                                    style: AppFontStyle.boldText
                                                        .copyWith(
                                                      height: 1.4,
                                                      fontSize: 18,
                                                      color: darkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    summarizeDigits(item.score),
                                                    style: AppFontStyle
                                                        .normalText
                                                        .copyWith(
                                                      height: 1.4,
                                                      fontSize: 15,
                                                      color: darkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeBottomBar(state: HomeBottomBarState.leaderboard)),
          ],
        ),
      ),
    );
  }
}
