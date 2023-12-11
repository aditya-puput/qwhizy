import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CirclePercent extends StatefulWidget {
  final double percent;
  final double radius;
  final double lineWidth;
  final double fontSize;
  final Color fontColor;
  final List<Color> colors;
  const CirclePercent(
      {super.key,
      required this.percent,
      this.radius = 40,
      this.lineWidth = 10,
      this.fontSize = 20,
      required this.fontColor,
      required this.colors});

  @override
  State<CirclePercent> createState() => _CirclePercentState();
}

class _CirclePercentState extends State<CirclePercent> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: widget.radius,
      lineWidth: widget.lineWidth,
      startAngle: 180,
      percent: widget.percent,
      animation: true,
      center: Text("${(widget.percent * 100).toStringAsFixed(0)}%",
          style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: "Baloo",
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [widget.fontColor, widget.fontColor],
                ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)))),
      linearGradient: LinearGradient(
          colors: widget.colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      backgroundColor: Colors.white.withOpacity(0.5),
      circularStrokeCap: CircularStrokeCap.square,
    );
  }
}
