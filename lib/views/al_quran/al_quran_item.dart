import 'package:flutter/material.dart';
import 'package:mdaq/common/data/al_quran.dart';
import 'package:mdaq/common/enum/tab_state.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/common/widgets/al_quran_list.dart';
import 'package:mdaq/common/widgets/custom_tab.dart';
import 'package:mdaq/common/widgets/top_bar.dart';

class AlQuranItem extends StatefulWidget {
  final TabState state;
  final AlQuran item;
  const AlQuranItem({super.key, required this.state, required this.item});

  @override
  State<AlQuranItem> createState() => _AlQuranListState();
}

class _AlQuranListState extends State<AlQuranItem>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: darkMode ? const Color(0xFF111725) : const Color(0xFFD4E1F2),
        child: Column(
          children: [
            const TopBar(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text('Al Quran',
                      style: AppFontStyle.boldText.copyWith(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          height: .1)),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: darkMode
                          ? const Color(0xFF111D3B)
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
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset(
                              'assets/images/number_frame2.png',
                            ),
                            Positioned(
                              top: 28,
                              child: Text(
                                '${widget.item.id}',
                                style: AppFontStyle.tabActiveText.copyWith(
                                    color: const Color(0xFF52BF90),
                                    fontSize: 28,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(widget.item.title,
                            style: AppFontStyle.boldText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                              fontSize: 30,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('${widget.item.revelation} - ${widget.item.numberVerses} ayat',
                            style: AppFontStyle.boldText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            Expanded(
              child: SizedBox( // CustomTab Height
                height: 350,
                child: CustomTab(
                  controller: _tabController!,
                  tabs: const ['Arab', 'Terjemahan'],
                  fontSize: 20,
                  views: [AlQuranList(state: TabState.arab, data: widget.item), AlQuranList(state: TabState.terjemahan, data: widget.item)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
