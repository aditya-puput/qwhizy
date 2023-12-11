import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mdaq/common/data/battle.dart';
import 'package:mdaq/common/data/bookmark.dart';
import 'package:mdaq/common/data/challenge.dart';
import 'package:mdaq/common/data/character.dart';
import 'package:mdaq/common/data/law.dart';
import 'package:mdaq/common/data/leaderboard.dart';
import 'package:mdaq/common/data/level.dart';
import 'package:mdaq/common/data/question.dart';
import 'package:mdaq/common/data/quiz.dart';
import 'package:mdaq/common/data/reminder.dart';
import 'package:mdaq/common/data/simple_list_item.dart';
import 'package:mdaq/common/data/user.dart';

User user = User(
  id: 1,
  name: "Agus Setiawan",
  username: "Agusetiawan19",
  coin: 434300,
  score: 33411400,
  level: 82,
  exp: 71837,
  maxExp: 80000,
  curChar:
      Character(id: 1, name: "Alif", frame: "alif_frame.png", char: "alif.png"),
  chars: [1],
  image: Image.asset(
    "assets/images/user_default.png",
    fit: BoxFit.cover,
  ),
);

bool darkMode = true;
final audioPlayer = AudioPlayer();
List<SimpleListItem> surah = [];
List<SimpleListItem> juz = [];
List<SimpleListItem> tajwid = [];
List<Bookmark> bookmark = [];
List<Reminder> reminder = [];
List<Law> law = [];
List<Challenge> challenge = [];
List<Leaderboard> leaderboard = [];
List<Character> character = [];
List<Quiz> quiz = [];
List<Battle> battle = [];
List<int?> answers = [];
List<Level> getLevels = [];
List<Level> getSurahLevels = [];
DateTime? quizTime;
DateTime? battleTime;

Future<void> playAyat(String url) async {
  await audioPlayer.play(UrlSource(url));
}

String summarizeDigits(int number) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    double result = number / 1000.0;
    return '${result.toStringAsFixed(2)}K';
  } else {
    double result = number / 1000000.0;
    return '${result.toStringAsFixed(2)}M';
  }
}

void loadLevels() {
  loadGetSurah();
  getLevels.clear();
  for (var originalLevel in getSurahLevels) {
    Level levelCopy = Level(
      title: originalLevel.title,
      juz: originalLevel.juz,
      questions: List<Question>.from(originalLevel.questions),
    );

    levelCopy.questions.forEach((question) {
      question.title = '${originalLevel.title} ${question.title}';
    });

    getLevels.add(levelCopy);
  }
}

void loadGetSurah() {
  getSurahLevels.clear();
  getSurahLevels.addAll([
    Level(title: "Al-Fatihah", juz: 1, questions: [
      Question(
          title: "Ayat 2",
          begin: "اَلْحَمْدُ",
          end: "الْعٰلَمِيْنَۙ",
          correct: 2,
          answers: ["حْمٰنِ", "الدِّيْنِ", "لِلّٰهِ رَبِّ", "وَاِيَّاكَ"]),
      Question(
          title: "Ayat 5",
          begin: "اِيَّاكَ نَعْبُدُ",
          end: "نَسْتَعِيْنُۗ",
          correct: 1,
          answers: ["الَّذِيْنَ", "وَاِيَّاكَ", "مٰلِكِ", "الصِّرَ"]),
      Question(
        title: "Ayat 4",
        end: "يَوْمِ الدِّيْنِۗ",
        correct: 0,
        answers: [
          "الَّذِيْنَ",
          "اَلْحَمْدُ",
          "مٰلِكِ",
          "اِيَّاكَ",
        ],
      ),
      Question(
        title: "Ayat 7",
        begin: "غَيْرِ",
        end: "عَلَيْهِمْ وَلَا الضَّاۤلِّيْنَ",
        correct: 3,
        answers: [
          "الْمَغْضُوْبِ",
          "صِرَاطَ الَّذِيْنَ",
          "الْعٰلَمِيْنَ",
          "نَسْتَعِيْنُ",
        ],
      ),
      Question(
        title: "Ayat 6",
        begin: "اِهْدِنَا الصِّرَاطَ",
        correct: 1,
        answers: [
          "الْعٰلَمِيْنَ",
          "الْمُسْتَقِيْمَ",
          "الْمَغْضُوْ",
          "نَسْتَعِيْنُ",
        ],
      ),
    ]),
    Level(
      title: "Al-Baqarah",
      juz: 1,
      questions: [
        Question(
          title: "Ayat 4",
          begin:
              "وَالَّذِيْنَ يُؤْمِنُوْنَ بِمَآ اُنْزِلَ اِلَيْكَ وَمَآ اُنْزِلَ مِنْ قَبْلِكَ ۚ وَبِالْاٰخِرَةِ هُمْ",
          correct: 1,
          answers: [
            "الْمُفْلِحُوْنَ",
            "يُوْقِنُوْنَ",
            "عَلَيْهِمْ",
            "وَيُقِيْمُوْنَ",
          ],
        ),
        Question(
          title: "Ayat 15",
          begin: "اَللّٰهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِيْ",
          end: "يَعْمَهُوْنَ",
          correct: 0,
          answers: [
            "طُغْيَانِهِمْ",
            "الضَّلٰلَةَ",
            "شَيٰطِيْنِهِمْ",
            "مُسْتَهْزِ",
          ],
        ),
        Question(
          title: "Ayat 39",
          end:
              "كَفَرُوْا وَكَذَّبُوْا بِاٰيٰتِنَآ اُولٰۤىِٕكَ اَصْحٰبُ النَّارِ ۚ هُمْ فِيْهَا خٰلِدُوْنَ",
          correct: 2,
          answers: [
            "وَاٰمِنُوْا",
            "وَلَا تَلْبِسُوا",
            "وَالَّذِيْنَ",
            "وَاِيَّايَ",
          ],
        ),
        Question(
          title: "Ayat 281",
          begin:
              "وَاتَّقُوْا يَوْمًا تُرْجَعُوْنَ فِيْهِ اِلَى اللّٰهِ ۗثُمَّ تُوَفّٰى كُلُّ نَفْسٍ مَّا كَسَبَتْ وَهُمْ لَا",
          end: "",
          correct: 3,
          answers: [
            "مُّؤْمِنِيْنَ",
            "تَعْلَمُوْنَ",
            "تُظْلَمُوْنَ",
            "يُظْلَمُوْنَ",
          ],
        ),
        Question(
          title: "Ayat 179",
          begin: "وَلَكُمْ فِى الْقِصَاصِ حَيٰوةٌ يّٰٓاُولِى",
          end: "لَعَلَّكُمْ تَتَّقُوْنَ",
          correct: 3,
          answers: [
            "بِالْمَعْرُوْ",
            "بِالْاُنْثٰى",
            "تَخْفِيْفٌ",
            "الْاَلْبَابِ",
          ],
        ),
      ],
    ),
    Level(
      title: "Al-Imran",
      juz: 1,
      questions: [
        Question(
          title: "Ayat 5",
          end: "يَخْفٰى عَلَيْهِ شَيْءٌ فِى الْاَرْضِ وَلَا فِى السَّمَاۤءِ",
          correct: 0,
          answers: [
            "اِنَّ اللّٰهَ لَا",
            "اِلٰهَ اِلَّا هُوَ",
            "اِنَّ الَّذِيْنَ",
            "ۗوَاللّٰهُ عَزِيْزٌ",
          ],
        ),
        Question(
          title: "Ayat 43",
          begin: "يٰمَرْيَمُ اقْنُتِيْ لِرَبِّكِ",
          end: "وَارْكَعِيْ مَعَ الرّٰكِعِيْنَ",
          correct: 1,
          answers: [
            "وَاصْطَفٰىكِ",
            "وَاسْجُدِيْ",
            "وَاِذْ قَالَتِ",
            "وَمَا كُنتَ",
          ],
        ),
        Question(
          title: "Ayat 82",
          begin: "فَمَنْ تَوَلّٰى بَعْدَ ذٰلِكَ فَاُولٰۤىِٕكَ هُمُ",
          correct: 3,
          answers: [
            "يُرجَعون",
            "الشَّاهِدِين",
            "الْخَاسِرِين",
            "الْفَاسِقُون",
          ],
        ),
        Question(
          title: "Ayat 139",
          begin: "وَلَا تَهِنُوْا",
          end: "وَاَنْتُمُ الْاَعْلَوْنَ اِنْ كُنْتُمْ مُّؤْمِنِيْنَ",
          correct: 1,
          answers: [
            "وَّموعظةٌ",
            "وَلَا تَحزنوا",
            "وَلِيَعلَمَ اللّٰهُ",
            "وَلِيُمَحِّصَ",
          ],
        ),
        Question(
          title: "Ayat 192",
          begin: "رَبَّنَآ اِنَّكَ مَنْ تُدْخِلِ النَّارَ",
          end: "وَمَا لِلظّٰلِمِيْنَ مِنْ اَنْصَارٍ",
          correct: 2,
          answers: [
            "فَءَامَنَّا",
            "فِي خَلْقِ السَّمَـٰوَٰتِ",
            "فَقَدْ أَخْزَيْتَهُمْ",
            "فَٱسْتَجَـٰبَ لَهُمْ",
          ],
        ),
      ],
    ),
    Level(
      title: "An-Nisa",
      juz: 1,
      questions: [
        Question(
          title: "Ayat 8",
          end:
              "اُولُوا الْقُرْبٰى وَالْيَتٰمٰى وَالْمَسٰكِيْنُ فَارْزُقُوْهُمْ مِّنْهُ وَقُوْلُوْا لَهُمْ",
          correct: 3,
          answers: [
            "وَلِلنِّسَاۤءِ نَصِيْبٌ",
            "وَابْتَلُوا الْيَتٰمٰى",
            "وَمن كان غَنِيًّا",
            "وَاِذَا حَضَرَ الْقِسْمَة",
          ],
        ),
        Question(
          title: "Ayat 41",
          begin:
              "فَكَيْفَ اِذَا جِئْنَا مِنْ كُلِّ اُمَّةٍۢ بِشَهِيْدٍ وَّجِئْنَا بِكَ عَلٰى",
          correct: 0,
          answers: [
            "هٰٓؤُلَاۤءِ شَهِيْدًا",
            "يُّضٰعِفْهَا",
            "وَلَا يَكْتُمُوْ",
            "بِوُجُوْهِكُمْ",
          ],
        ),
        Question(
          title: "Ayat 96",
          begin: "دَرَجٰتٍ مِّنْهُ",
          end: "ةً وَّرَحْمَةً ۗوَكَانَ اللّٰهُ غَفُوْرًا رَّحِيْمًا",
          correct: 1,
          answers: [
            "فَضَّلَ اللّٰ",
            "وَمَغْفِرَ",
            "وَاسِعَةً",
            "وَالْمُجٰهِدُوْ",
          ],
        ),
        Question(
          title: "Ayat 121",
          begin: "اُولٰۤىِٕكَ مَأْوٰىهُمْ جَهَنَّمُۖ",
          end: "نَ عَنْهَا مَحِيْصًا",
          correct: 1,
          answers: [
            "وَالْمُجٰهِدُوْ",
            "اُولٰۤىِٕكَ مَأْوٰىهُمْ",
            "وَالَّذِيْنَ اٰمَنُوْا",
            "وَلَا يَجِدُوْ",
          ],
        ),
        Question(
          title: "Ayat 169",
          end:
              "جَهَنَّمَ خٰلِدِيْنَ فِيْهَآ اَبَدًا ۗوَكَانَ ذٰلِكَ عَلَى اللّٰهِ يَسِيْرًا",
          correct: 0,
          answers: [
            "اِلَّا طَرِيْقَ",
            "وَاِنْ تَكْفُرُوْا",
            "وَكَانَ اللّٰ",
            "اِنَّ الَّذِ",
          ],
        ),
      ],
    ),
    Level(
      title: "Al-Maidah",
      juz: 1,
      questions: [
        Question(
          title: "Ayat 10",
          end:
              "كَفَرُوْا وَكَذَّبُوْا بِاٰيٰتِنَآ اُولٰۤىِٕكَ اَصْحٰبُ الْجَحِيْمِ",
          correct: 0,
          answers: [
            "وَالَّذِيْنَ",
            "يٰٓاَيُّهَا الَّذِيْنَ",
            "وَعَدَ اللّٰهُ",
            "وَعَلَى اللّٰهِ",
          ],
        ),
        Question(
          title: "Ayat 43",
          begin:
              "وَكَيْفَ يُحَكِّمُوْنَكَ وَعِنْدَهُمُ التَّوْرٰىةُ فِيْهَا حُكْمُ اللّٰهِ ثُمَّ يَتَوَلَّوْنَ مِنْۢ بَعْدِ ذٰلِكَ ۗوَمَآ اُولٰۤىِٕكَ",
          correct: 2,
          answers: [
            "الْمُقْسِطِيْنَ",
            "الْكٰفِرُوْنَ",
            "بِالْمُؤْمِنِيْنَ",
            "الظّٰلِمُوْنَ",
          ],
        ),
        Question(
          title: "Ayat 58",
          begin: "وَاِذَا نَادَيْتُمْ",
          end:
              "اتَّخَذُوْهَا هُزُوًا وَّلَعِبًا ۗذٰلِكَ بِاَ نَّهُمْ قَوْمٌ لَّا يَعْقِلُوْنَ",
          correct: 1,
          answers: [
            "اِلَيْنَا وَمَآ",
            "اِلَى الصَّلٰوةِ",
            "اِنْ كُنْتُمْ",
            "اَكْثَرَكُمْ",
          ],
        ),
        Question(
          title: "Ayat 74",
          begin: "اَفَلَا يَتُوْبُوْنَ اِلَى اللّٰهِ وَيَسْتَغْفِرُوْنَهٗۗ",
          end: "رٌ رَّحِيْمٌ",
          correct: 3,
          answers: [
            "اِنَّ اللّٰهَ ثَالِثُ",
            "وَاِنْ لَّمْ يَنْتَهُوْا",
            "اُنْظُرْ كَيْفَ",
            "وَاللّٰهُ غَفُوْرٌ رَّحِيْمٌ",
          ],
        ),
        Question(
          title: "Ayat 102",
          begin: "قَدْ سَاَلَهَا قَوْمٌ مِّنْ",
          end: "اَصْبَحُوْا بِهَا كٰفِرِيْنَ",
          correct: 0,
          answers: [
            "اِنَّ اللّٰهَ ثَالِثُ",
            "وَاِنْ لَّمْ يَنْتَهُوْا",
            "اُنْظُرْ كَيْفَ",
            "وَاللّٰهُ غَفُوْ",
          ],
        ),
      ],
    ),
    Level(title: "Al-Bayyinah", juz: 30, questions: [
      Question(
          title: "Ayat 1",
          begin: "لَمْ يَكُنِ",
          end:
              "مِنْ اَهْلِ الْكِتٰبِ وَالْمُشْرِكِيْنَ مُنْفَكِّيْنَ حَتّٰى تَأْتِيَهُمُ الْبَيِّنَةُۙ",
          correct: 0,
          answers: [
            "مِّنَ اللّٰهِ",
            "لَّذِيْنَ اُوْتُوا الْكِتٰبَ",
            "الصَّلٰوةَ",
            "اٰمَنُوْا"
          ]),
      Question(
        title: "Ayat 4",
        end:
            "الَّذِيْنَ اُوْتُوا الْكِتٰبَ اِلَّا مِنْۢ بَعْدِ مَا جَاۤءَتْهُمُ الْبَيِّنَةُ ۗ",
        correct: 2,
        answers: [
          "وَمَآ اُمِرُوْٓا",
          "وَيُقِيْمُوا",
          "الصَّلٰوةَ",
          "اٰمَنُوْا"
        ],
      ),
      Question(
        title: "Ayat 7",
        begin:
            "اِنَّ الَّذِيْنَ اٰمَنُوْا وَعَمِلُوا الصّٰلِحٰتِ اُولٰۤىِٕكَ هُمْ",
        end: "شَرُّ الْبَرِيَّةِ",
        correct: 2,
        answers: [
          "شَرُّ الْبَرِيَّةِ",
          "خَيْرُ الْبَرِيَّةِ",
          "خَشِيَ رَبَّهٗ",
          "كُتُبٌ قَيِّمَةٌ"
        ],
      ),
      Question(
        title: "Ayat 2",
        begin: "رَسُوْلٌ",
        end: "يَتْلُوْا صُحُفًا مُّطَهَّرَةًۙ",
        correct: 0,
        answers: [
          "رَسُوْلٌ مِّنَ اللّٰهِ",
          "مِّنْۢ بَعْدِ",
          "مِنْ اَهْلِ",
          "الَّذِيْنَ اٰمَنُوْا"
        ],
      ),
      Question(
        title: "Ayat 6",
        begin: "اِنَّ الَّذِيْنَ كَفَرُوْا مِنْ",
        end:
            "وَالْمُشْرِكِيْنَ فِيْ نَارِ جَهَنَّمَ خٰلِدِيْنَ فِيْهَاۗ اُولٰۤىِٕكَ هُمْ شَرُّ الْبَرِيَّةِۗ",
        correct: 3,
        answers: [
          "رَضِيَ اللّٰهُ",
          "وَيُقِيْمُوا",
          "رَسُوْلٌ مِّنَ اللّٰهِ",
          "اَهْلِ الْكِتٰبِ"
        ],
      ),
    ]),
    Level(
      juz: 30,
      title: "Al-Alaq",
      questions: [
        Question(
          title: "Ayat 19",
          begin: "كَلَّاۗ لَا تُطِعْهُ",
          end: "وَاقْتَرِبْ",
          correct: 0,
          answers: ["وَاسْجُدْ", "فَلْيَدْعُ", "سَنَدْعُ", "نَاصِيَةٍ"],
        ),
        Question(
          title: "Ayat 15",
          end: "لَّمْ يَنْتَهِ ەۙ لَنَسْفَعًاۢ بِالنَّاصِيَةِۙ",
          correct: 3,
          answers: [
            "كَاذِبَةٍ",
            "يَعْلَمْ",
            "بِاَنَّ اللّٰهَ",
            "كَلَّا لَىِٕن"
          ],
        ),
        Question(
          title: "Ayat 1",
          begin: "اِقْرَأْ بِاسْمِ رَبِّكَ",
          correct: 2,
          answers: [
            "وَرَبُّكَ الْاَ",
            "الْاِنْسَانَ",
            "الَّذِيْ خَلَقَ",
            "الَّذِيْ عَلَّمَ"
          ],
        ),
        Question(
          title: "Ayat 6",
          begin: "كَلَّآ",
          end: "لَيَطْغٰىٓ ۙ",
          correct: 1,
          answers: [
            "اَنْ رَّاٰهُ",
            "اِنَّ الْاِنسٰنَ",
            "اِنَّ اِلٰى",
            "اَرَاَيْتَ"
          ],
        ),
        Question(
          title: "Ayat 13",
          end: "اِن كَذَّبَ وَتَوَلّٰىۗ",
          correct: 1,
          answers: [
            "اَلَم يَعْلَمْ",
            "اَرَاَيْتَ",
            "كَلَّى لَىِٕن",
            "نَاصِيَةٍ"
          ],
        ),
      ],
    ),
    Level(
      juz: 30,
      title: "Al-Lail",
      questions: [
        Question(
          title: "Ayat 3",
          begin: "وَمَا خَلَقَ الذَّكَرَ وَالْاُنْثٰىٓ ۙ",
          correct: 0,
          answers: ["اِنَّ سَعْيَكُمْ لَشَتّٰىۗ", "وَالنَّهَارِ اِذَا تَجَلّٰىۙ", "وَصَدَّقَ بِالْحُسْنٰىۙ", "فَسَنُيَسِّرُهٗ لِلْيُسْرٰىۗ"],
        ),
        Question(
          title: "Ayat 11",
          end: "عَنْهُ مَالُهٗٓ اِذَا تَرَدّٰىٓۙ",
          correct: 2,
          answers: [
            "وَاِنَّ لَنَا",
            "فَاَنْذَرْتُكُمْ",
            "وَمَا يُغْنِيْ",
            "لَا يَصْلٰىهَآ"
          ],
        ),
        Question(
          title: "Ayat 21",
          begin: "وَلَسَوْ",
          end: " ࣖ",
          correct: 1,
          answers: [
            "اِلَّا ابْتِغَاۤءَ",
            "فَ يَرْضٰى",
            "وَمَا لِاَحَدٍ",
            "وَسَيُجَنَّبُهَا"
          ],
        ),
        Question(
          title: "Ayat 15",
          begin: "لَا",
          end: " اِلَّا الْاَشْقَىۙ",
          correct: 0,
          answers: [
            "يَصْلٰىهَآ",
            "عَلَيْنَا",
            "يُغْنِيْ",
            "اَمَّا مَنْۢ"
          ],
        ),
        Question(
          title: "Ayat 18",
          begin: "وَاَمَّا مَنْۢ بَخِلَ وَاسْتَغْنٰىۙ",
          correct: 1,
          answers: [
            "فَسَنُيَسِّرُهٗ لِلْيُسْرٰىۗ",
            "وَكَذَّبَ بِالْحُسْنٰىۙ",
            "فَسَنُيَسِّرُهٗ لِلْعُسْرٰىۗ",
            "وَصَدَّقَ بِالْحُسْنٰىۙ"
          ],
        ),
      ],
    ),
  ]);
}
