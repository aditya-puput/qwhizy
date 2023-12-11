import 'package:flutter/material.dart';
import 'package:mdaq/common/data/bookmark.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getBookmark(BuildContext context, Function() refresh) async {
  bookmark.clear();
  bookmark.add(Bookmark(
      id: 1, surah: 1, ayat: 2, juz: 1, surahName: "Al-Fatihah", verses: 7));
  bookmark.add(Bookmark(
      id: 2, surah: 2, ayat: 11, juz: 1, surahName: "Al-Baqarah", verses: 286));
}
