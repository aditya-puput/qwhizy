import 'package:flutter/material.dart';
import 'package:mdaq/common/http/bookmark.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {
    super.initState();
    getBookmark(context, () => refresh());
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
            const TopBar(),
            Container(
              margin: const EdgeInsets.only(top: 100),
              height: 280,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Penanda',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    'assets/icons/bookmark.png',
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
                  child: Builder(
                    builder: (context) {
                      if (bookmark.isEmpty) {
                        return const Loading();
                      }
                      return ListView.builder(
                        itemCount: bookmark.length,
                        itemBuilder: (BuildContext context, int i) {
                          final item = bookmark[i];
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
                                  color:
                                      const Color(0xFF4F4F4F).withOpacity(0.31),
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
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/icons/ayat-bookmark.png',
                                            width: 28,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 2,
                                                  ),
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'QS ${item.surahName} ${item.surah}: Ayat ${item.ayat} (Juz ${item.juz})',
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
            ),
          ],
        ),
      ),
    );
  }
}
