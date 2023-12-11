import 'package:mdaq/common/data/ayat.dart';

class AlQuran {
  final int id;
  final String title;
  final String revelation;
  final int numberVerses;
  final List<Ayat> verses;

  AlQuran({required this.id, required this.title, required this.revelation, required this.numberVerses, required this.verses});
}
