import 'package:flutter/material.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';

class CustomTab extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;
  final double? fontSize;
  final List<Widget> views;

  const CustomTab({
    Key? key,
    required this.controller,
    required this.tabs,
    this.fontSize,
    required this.views,
  }) : super(key: key);

  @override
  State<CustomTab> createState() => _TabState();
}


class _TabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: TabBar(
            controller: widget.controller,
            tabs: widget.tabs.map((tabText) {
              return Tab(
                text: tabText,
                height: 24,
              );
            }).toList(),
            labelStyle: AppFontStyle.tabActiveText.copyWith(fontSize: widget.fontSize),
            unselectedLabelStyle: AppFontStyle.tabText.copyWith(fontSize: widget.fontSize),
            indicator: null,
            indicatorColor: Colors.transparent,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 31),
          height: 1.2,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            gradient: !darkMode
                ? const LinearGradient(
                    colors: [
                      Color(0xFF3CEAC1),
                      Color(0xFF00C0DA),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.controller,
            children: widget.views,
          ),
        ),
      ],
    );
  }
}