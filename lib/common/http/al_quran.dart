import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mdaq/common/data/al_quran.dart';
import 'package:mdaq/common/data/ayat.dart';
import 'package:mdaq/common/data/simple_list_item.dart';
import 'package:mdaq/common/enum/tab_state.dart';
import 'dart:convert';

import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/views/al_quran/al_quran_item.dart';

const baseUrl = "https://quran-api-id.vercel.app/";

// Get Surah
Future<void> getSurah(BuildContext context, Function() refresh) async {
  const String url = '${baseUrl}surahs';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final Uri uri = Uri.parse(url);

  try {
    final response = await http.get(
      uri,
      headers: headers,
    );

    final responseBody = json.decode(response.body);
    if (responseBody is List) {
      final List<SimpleListItem> items = responseBody.map((itemJson) {
        return SimpleListItem(
          id: itemJson['number'] as int,
          title: itemJson['name'] as String,
        );
      }).toList();
      surah = items;
      refresh();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${responseBody['message']}")));
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}

Future<void> getJuz(BuildContext context, Function() refresh) async {
  juz.clear();
  for (int i = 1; i <= 30; i++) {
    juz.add(SimpleListItem(id: i, title: "Juz $i"));
  }
}

// Get Surah
Future<void> getAlQuran(BuildContext context, int id) async {
  final String url = '${baseUrl}surahs/$id';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Uri uri = Uri.parse(url);

  try {
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final int id = responseBody['number'] as int;
      final String title = responseBody['name'] as String;
      final String revelation = responseBody['revelation'] as String;
      final int numberVerses = responseBody['numberOfAyahs'] as int;
      final List<Ayat> verses = (responseBody['ayahs'] as List).map((ayatJson) {
        return Ayat(
          id: ayatJson['number']['inSurah'] as int,
          arab: ayatJson['arab'] as String,
          translation: ayatJson['translation'] as String,
          audio: ayatJson['audio']['alafasy'] as String,
        );
      }).toList();

      final AlQuran item = AlQuran(
          id: id,
          title: title,
          revelation: revelation,
          numberVerses: numberVerses,
          verses: verses);

      Navigator.of(context).push(
        TransitionFade(
          child: AlQuranItem(
            state: TabState.surah,
            item: item,
          ),
        ),
      );
    } else {
      final responseBody = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${responseBody['message']}"),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: $e"),
      ),
    );
  }
}
