import 'package:flutter/material.dart';
import 'package:mdaq/common/data/law.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getLaw(BuildContext context, Function() refresh) async {
  law.clear();
  law.add(Law(
      id: 1,
      title: "Ghunnah",
      content:
          "Ketika huruf Nun mati نْ atau Tanwin ــًـــٍــٌـ bertemu dengan salah satu dari 4 huruf ini (و م ن ي). Cara baca hukum Idham Bighunnah yaitu meleburkan nun mati atau tanwin dengan huruf di depannya dan seolah-olah huruf N di nun mati atau tanwin tidak dibaca dan sambil didengungkan serta ditahan sekitar 2 harakat sebelum menyebut jelas huruf di depannya. * Namun jika huruf Nun mati نْ bertemu dengan huruf Wau (و) atau Ya (ي) itu tersambung (tanpa dipisah oleh spasi), maka hukumnya menjadi Idzhar Wajib (dibaca dengan jelas tanpa dengung) contohnya ada di QS. Al-Baqarah ayat 86 pada kata 'dun-yaa'. Di aplikasi ini hukum Idzhar tidak kami beri warna dikarenakan hukum Idzhar dibaca jelas sesuai huruf tanpa ada dengung.."));
  law.add(Law(
      id: 2,
      title: "Idgham Bilaghunnah",
      content:
          "Ketika huruf Nun mati نْ atau Tanwin ــًـــٍــٌـ bertemu dengan salah satu dari 2 huruf ini Lam (ل) atau Ra (ر). Cara baca hukum Idham Bilaghunnah yaitu meleburkan nun mati atau tanwin dengan huruf di depannya dan seolah-olah huruf N di nun mati atau tanwin tidak dibaca tanpa didengungkan serta ditahan sekitar 1 atau 2 harakat sebelum menyebut jelas huruf di depannya."));
}
