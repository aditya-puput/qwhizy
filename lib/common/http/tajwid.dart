import 'package:flutter/material.dart';
import 'package:mdaq/common/data/simple_list_item.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getTajwid(BuildContext context, Function() refresh) async {
  tajwid.clear();
  List<String> content = [
    'Ghunnah',
    'Idhgam Bighunnah',
    'Idhgam Bilaghunnah',
    'Idhgam Mitslain'
  ];
  for (int i = 1; i <= content.length; i++) {
    tajwid.add(SimpleListItem(id: i, title: content[i - 1]));
  }
}
