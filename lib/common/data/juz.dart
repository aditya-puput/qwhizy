class Juz {
  final String title;
  final int surah;
  final int verse;

  Juz(
      {required this.title,
      required this.surah,
      required this.verse});
}

final List<Juz> getJuz = [
  Juz(
    title: 'Juz 1',
    surah: 1,
    verse: 1
  ),
    Juz(
    title: 'Juz 2',
    surah: 1,
    verse: 1
  )
];
