import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mdaq/common/data/al_quran.dart';
import 'package:mdaq/common/enum/tab_state.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/theme/app_font_style.dart';

class AlQuranList extends StatefulWidget {
  final TabState state;
  final AlQuran data;

  const AlQuranList({
    Key? key,
    required this.state,
    required this.data,
  }) : super(key: key);

  @override
  State<AlQuranList> createState() => _SimpleListState();
}

class _SimpleListState extends State<AlQuranList> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.verses.length + 1,
      itemBuilder: (BuildContext context, int i) {
        if (i == 0) {
          if (widget.data.id == 1 || widget.data.id == 9) return Container();
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.15,
                vertical: 8),
            child: Image.asset(
              "assets/images/bismilah.png",
              color: darkMode ? Colors.white : Colors.black,
            ),
          );
        } else {
          final ayat = widget.data.verses[i - 1];
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: darkMode
                      ? const Color(0xFF233256)
                      : const Color(0xFFE7EEF8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(
                    color: const Color(0xFF4F4F4F).withOpacity(0.31),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/number_frame.png',
                                ),
                                Positioned(
                                  top: ayat.id >= 100 ? 11 : 10,
                                  child: Text(
                                    '${ayat.id}',
                                    style: AppFontStyle.boldText.copyWith(
                                      color: const Color(0xFF52BF90),
                                      fontSize: ayat.id >= 100 ? 13 : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icons/ayat-mic.png",
                                    width: 28,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await player.play(UrlSource(ayat.audio));
                                  },
                                  child: Image.asset(
                                    "assets/icons/ayat-play.png",
                                    width: 28,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icons/ayat-bookmark.png",
                                    width: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                width: double.infinity,
                alignment: widget.state == TabState.arab
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  widget.state == TabState.arab ? ayat.arab : ayat.translation,
                  textAlign: widget.state == TabState.arab
                      ? TextAlign.end
                      : TextAlign.justify,
                  style: AppFontStyle.simpleListText.copyWith(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: widget.state == TabState.arab ? 22 : null,
                      fontFamily: widget.state == TabState.terjemahan
                          ? 'Baloo2'
                          : null),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          );
        }
      },
    );
  }
}
