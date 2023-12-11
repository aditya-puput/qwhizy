import 'package:flutter/material.dart';
import 'package:mdaq/common/data/leaderboard.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';

class TopLeaderboard extends StatefulWidget {
  final Leaderboard data;
  final String title;
  final double height;
  final List<Color> gradient;
  const TopLeaderboard(
      {super.key,
      required this.data,
      required this.title,
      required this.height,
      required this.gradient});

  @override
  State<TopLeaderboard> createState() => _TopLeaderboardState();
}

class _TopLeaderboardState extends State<TopLeaderboard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: widget.height,
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 4,
          ),
          decoration: BoxDecoration(
          color: const Color(0xFFD4E1F2),
          gradient: LinearGradient(
                  colors: widget.gradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 62,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
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
                                    '${widget.data.level}',
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
                        height: 15,
                      ),
                      Text(
                        widget.title,
                        style: AppFontStyle.boldText.copyWith(
                          height: .5,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                widget.data.name,
                                style: AppFontStyle.boldText.copyWith(
                                  height: 1.2,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '@${widget.data.username}',
                                style: AppFontStyle.normalText.copyWith(
                                  height: 1.2,
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Skor',
                                style: AppFontStyle.boldText.copyWith(
                                  height: 1.4,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                summarizeDigits(widget.data.score),
                                style: AppFontStyle.normalText.copyWith(
                                  height: 1.4,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
