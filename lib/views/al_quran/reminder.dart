import 'package:flutter/material.dart';
import 'package:mdaq/common/http/reminder.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  void initState() {
    super.initState();
    getReminder(context, refresh);
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
                  Text('Pengingat',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    'assets/icons/reminder.png',
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
                      if (reminder.isEmpty) {
                        return const Loading();
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.38,
                            child: ListView.builder(
                              itemCount: reminder.length,
                              itemBuilder: (BuildContext context, int i) {
                                final item = reminder[i];
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 36,
                                    ),
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: darkMode
                                          ? const Color(0xFF233256)
                                          : const Color(0xFFE7EEF8),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      border: Border.all(
                                        color: const Color(0xFF4F4F4F)
                                            .withOpacity(0.31),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16,
                                                top: 8,
                                                bottom: 8,
                                                right: 8),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${item.hours < 10 ? '0' : ''}${item.hours}:${item.minutes < 10 ? '0' : ''}${item.minutes}',
                                                        style: AppFontStyle
                                                            .boldText
                                                            .copyWith(
                                                          fontSize: 26,
                                                          height: 1.3,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        item.info,
                                                        style: AppFontStyle
                                                            .boldText
                                                            .copyWith(
                                                          fontSize: 16,
                                                          height: 1.3,
                                                          color: darkMode
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  "Setiap Hari",
                                                  style: AppFontStyle.normalText
                                                      .copyWith(
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    color: darkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                    'assets/icons/reminder-edit.png',
                                                    width: 46,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/reminder-plus.png',
                              width: 46,
                            ),
                          )
                        ],
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
