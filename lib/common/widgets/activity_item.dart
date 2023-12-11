import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdaq/common/data/activity.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/widgets/circle_percent.dart';

class ActivityItem extends StatefulWidget {
  final Activity data;
  final Color fontColor;
  final List<Color> colors;

  const ActivityItem(
      {super.key,
      required this.data,
      required this.fontColor,
      required this.colors});

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Battle",
            style: AppFontStyle.boldText
                .copyWith(fontSize: 19, color: widget.fontColor),
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              Column(
                children: [
                  CirclePercent(
                    percent: widget.data.percent,
                    fontColor: widget.fontColor,
                    colors: widget.colors,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    widget.data.title,
                    style: AppFontStyle.boldText.copyWith(
                        fontSize: 17,
                        color: darkMode ? Colors.white : Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Score",
                          style: AppFontStyle.boldText.copyWith(
                              fontSize: 17,
                              color: darkMode ? Colors.white : Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${widget.data.score}',
                          style: AppFontStyle.normalText.copyWith(
                              fontSize: 17,
                              color: darkMode ? Colors.white : Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Time",
                          style: AppFontStyle.boldText.copyWith(
                              fontSize: 17,
                              color: darkMode ? Colors.white : Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          DateFormat('HH:mm:ss').format(widget.data.time),
                          style: AppFontStyle.normalText.copyWith(
                              fontSize: 17,
                              color: darkMode ? Colors.white : Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
