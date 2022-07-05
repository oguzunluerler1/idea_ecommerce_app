import 'package:idea_ecommerce_app/services/calculator.dart';

import 'urun.dart';

class Degerlendirme {
  final String yorum;
  final int puan;
  final DateTime tarih;
  //final int resim; //todo RESMİ NASIL TUTACAĞIMIZI BELİRLEDİKTEN SONRA EKLİYCEM.STORAGE'A BAKMAM LAZIM.
  final Urun urun;

  Degerlendirme(
      {required this.yorum,
      required this.puan,
      required this.tarih,
      required this.urun});

  Map<String, dynamic> toMap() => {
        'yorum': yorum,
        'puan': puan,
        'tarih': Calculator.datetimeToTimestamp(tarih),
        'urun': urun,
      };

  factory Degerlendirme.fromMap(Map map) => Degerlendirme(
        yorum: map['yorum'],
        puan: map['puan'],
        tarih: Calculator.datetimeFromTimestamp(map['tarih']),
        urun: map['urun'],
      );
}
