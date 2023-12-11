class Question {
  String title;
  final String begin;
  final String end;
  final int correct;
  final List<String> answers;

  Question(
      {required this.title,
      this.begin = '',
      this.end = '',
      required this.correct,
      required this.answers});
}
