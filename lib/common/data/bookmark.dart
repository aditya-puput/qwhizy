class Bookmark {
  final int id;
  final int surah;
  final int ayat;
  final int juz;
  final String surahName;
  final int verses;

  Bookmark(
      {required this.id,
      required this.surah,
      required this.ayat,
      required this.juz,
      required this.surahName,
      required this.verses});
}
