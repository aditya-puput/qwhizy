import 'package:flutter/material.dart';
import 'package:mdaq/common/data/simple_list_item.dart';
import 'package:mdaq/common/enum/tab_state.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/http/al_quran.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/widgets/loading.dart';

class SimpleList extends StatefulWidget {
  final TabState state;
  final List<SimpleListItem> data;

  const SimpleList({
    Key? key,
    required this.state,
    required this.data,
  }) : super(key: key);

  @override
  State<SimpleList> createState() => _SimpleListState();
}

class _SimpleListState extends State<SimpleList> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.data.isEmpty) {
          return const Loading();
        }
        return ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int i) {
            final item = widget.data[i];
            return GestureDetector(
              onTap: () {
                if (widget.state == TabState.surah) {
                  getAlQuran(context, item.id);
                }
              },
              child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/number_frame.png',
                                ),
                                Positioned(
                                  top: item.id >= 100 ? 11 : 10,
                                  child: Text(
                                    '${item.id}',
                                    style: AppFontStyle.boldText.copyWith(
                                      color: const Color(0xFF52BF90),
                                      fontSize: item.id >= 100 ? 13 : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  alignment: Alignment.topLeft,
                                  width: 170,
                                  child: Text(
                                    item.title,
                                    style: AppFontStyle.simpleListText.copyWith(
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
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
            );
          },
        );
      },
    );
  }
}
