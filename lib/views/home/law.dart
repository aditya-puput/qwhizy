import 'package:flutter/material.dart';
import 'package:mdaq/common/http/Law.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/loading.dart';
import 'package:mdaq/common/widgets/top_bar.dart';

class Law extends StatefulWidget {
  const Law({super.key});

  @override
  State<Law> createState() => _LawState();
}

class _LawState extends State<Law> {
  @override
  void initState() {
    super.initState();
    getLaw(context, () => refresh());
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
                  Text('Hukum Bacaan',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    'assets/icons/law.png',
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 340),
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
                    if (law.isEmpty) {
                      return const Loading();
                    }
                    return ListView.builder(
                      itemCount: law.length,
                      itemBuilder: (BuildContext context, int i) {
                        final item = law[i];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 8
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFFD4E1F2),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF3CEAC1),
                                      Color(0xFF00C0DA),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 6,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 2,
                                            ),
                                            alignment: Alignment.topLeft,
                                            width: double.infinity,
                                            child: Text(
                                              item.title,
                                              style: AppFontStyle.simpleListText
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 24),
                              width: double.infinity,
                              child: Text(
                                item.content,
                                textAlign: TextAlign.justify,
                                style: AppFontStyle.simpleListText.copyWith(
                                    color:
                                        darkMode ? Colors.white : Colors.black,
                                    fontSize: 14.5,
                                    height: 1.2,
                                    fontFamily: 'Baloo2'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
