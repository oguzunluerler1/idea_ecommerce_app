import '../services/calculator.dart';
import 'adres.dart';
import 'urun.dart';

class Musteri {
  final String uid;
  final String adSoyad;
  final String cinsiyet;
  final DateTime dogumTarihi;
  final List<Urun> favoriler;
  final String mail;
  final List<Urun> sepettekiUrunler;
  final Map<String, String> telefon;
  final List<Urun> tiklananUrunler;
  final List<Adres> adres;

  Musteri(
      {required this.uid,
      required this.adSoyad,
      required this.cinsiyet,
      required this.dogumTarihi,
      required this.favoriler,
      required this.mail,
      required this.sepettekiUrunler,
      required this.telefon,
      required this.tiklananUrunler,
      required this.adres});

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'adSoyad': adSoyad,
        'cinsiyet': cinsiyet,
        'dogumTarihi': Calculator.datetimeToTimestamp(dogumTarihi),
        'favoriler': favoriler,
        'mail': mail,
        'sepettekiUrunler': sepettekiUrunler,
        'telefon': telefon,
        'tiklananUrunler': tiklananUrunler,
        'adres': adres
      };

  factory Musteri.fromMap(Map map) => Musteri(
      uid: map['uid'],
      adSoyad: map['adSoyad'],
      cinsiyet: map['cinsiyet'],
      dogumTarihi: Calculator.datetimeFromTimestamp(map['dogumTarihi']),
      favoriler: map['favoriler'],
      mail: map['mail'],
      sepettekiUrunler: map['sepettekiUrunler'],
      telefon: map['telefon'],
      tiklananUrunler: map['tiklananUrunler'],
      adres: map['adres']);
}
