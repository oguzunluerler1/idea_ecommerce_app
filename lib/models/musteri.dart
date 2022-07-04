import 'adres.dart';
import 'urun.dart';

class Customer {
  final String adSoyad;
  final String cinsiyet;
  //final TimeStamp dogumTarihi;  //!Bunu ayarlayıp constructor'a ekliycem.
  final List<Product> favoriler;
  final String mail;
  final List<Product> sepettekiUrunler;
  final Map<String, String> telefon;
  final List<Product> tiklananUrunler;
  final List<Adres> adres;

  Customer(
      {required this.adSoyad,
      required this.cinsiyet,
      required this.favoriler,
      required this.mail,
      required this.sepettekiUrunler,
      required this.telefon,
      required this.tiklananUrunler,
      required this.adres});

  Map<String, dynamic> toMap() => {
        'adSoyad': adSoyad,
        'cinsiyet': cinsiyet,
        'favoriler': favoriler,
        'mail': mail,
        'sepettekiUrunler': sepettekiUrunler,
        'telefon': telefon,
        'tiklananUrunler': tiklananUrunler,
        'adres': adres
      };

  factory Customer.fromMap(Map map) => Customer(
      adSoyad: map['adSoyad'],
      cinsiyet: map['cinsiyet'],
      favoriler: map['favoriler'],
      mail: map['mail'],
      sepettekiUrunler: map['sepettekiUrunler'],
      telefon: map['telefon'],
      tiklananUrunler: map['tiklananUrunler'],
      adres: map['adres']);
}
