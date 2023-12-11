import 'package:flutter/material.dart';
import 'package:mdaq/common/data/activity.dart';
import 'package:mdaq/common/http/character.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/activity_chart.dart';
import 'package:mdaq/common/widgets/activity_item.dart';
import 'package:mdaq/common/widgets/char_item.dart';
import 'package:mdaq/common/widgets/custom_tab.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';
import 'package:mdaq/common/widgets/user_exp.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    getCharacter(context, refresh);
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
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
          color: const Color(0xFFE7EEF8),
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
        child: Column(
          children: [
            const TopBar(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: darkMode
                          ? const Color(0xFF111D3B)
                          : const Color(0xFFE7EEF8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      border: Border.all(
                        color: const Color(0xFF4F4F4F).withOpacity(0.31),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 92,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: Image.asset(
                                        "assets/images/user_default.png",
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/level.png',
                                      width: 24,
                                    ),
                                    Text(
                                      '${user.level}',
                                      style: AppFontStyle.boldText.copyWith(
                                        color: const Color(0xFF0F6EDE),
                                        height: 1.8,
                                        fontSize: user.level >= 100 ? 10 : 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(user.name,
                            style: AppFontStyle.boldText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                              fontSize: 24,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '@${user.username}',
                          style: AppFontStyle.normalText.copyWith(
                            height: 1.2,
                            fontSize: 14,
                            color: darkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          height: 24,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              UserEXP(
                                progress: (user.exp / user.maxExp).toDouble(),
                              ),
                              Text(
                                '${user.exp}/${user.maxExp}',
                                style: AppFontStyle.boldText.copyWith(
                                  color: Colors.white,
                                  height: 2,
                                  fontSize: user.level >= 100 ? 10 : 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Skor',
                                    style: AppFontStyle.boldText.copyWith(
                                      height: 1.4,
                                      fontSize: 18,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    summarizeDigits(user.score),
                                    style: AppFontStyle.normalText.copyWith(
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomTab(
                controller: _tabController!,
                tabs: const ['Aktivitas', 'Karakter'],
                fontSize: 24,
                views: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 20, left: 20),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            const ActivityChart(),
                            const SizedBox(height: 8,),
                            ActivityItem(data: Activity(title: "Win Rate", score: 1955, time: DateTime.now(), percent: 0.65), fontColor: const Color(0xFFE59700), colors: const [Color(0xFFEFCF42), Color(0xFFE59700)],),
                            const SizedBox(height: 20,),
                            ActivityItem(data: Activity(title: "Soal Benar", score: 1955, time: DateTime.now(), percent: 0.65), fontColor: const Color(0xFF00C0DA), colors: const [Color(0xFF3CEAC1), Color(0xFF00C0DA)],)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.bottomCenter,
                    child: Builder(builder: (context) {
                      if (character.isEmpty) {
                        return const Loading();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                        ),
                        child: GridView.builder(
                          shrinkWrap:
                              true, // Allow the GridView to adjust its size
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 0,
                            childAspectRatio: 0.58,
                          ),
                          itemCount: character.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CharItem(data: character[index]);
                          },
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
