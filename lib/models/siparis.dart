import '../services/calculator.dart';
import 'urun.dart';

class Siparis {
  final String id;
  final DateTime siparisTarihi;
  final List<Urun> urunler;

  Siparis(
      {required this.id, required this.siparisTarihi, required this.urunler});

  Map<String, dynamic> toMap() => {
        'id': id,
        'urunler': urunler,
        'siparisTarihi': Calculator.datetimeToTimestamp(siparisTarihi),
      };

  factory Siparis.fromMap(Map map) => Siparis(
        id: map['id'],
        urunler: map['urunler'],
        siparisTarihi: Calculator.datetimeFromTimestamp(map['siparisTarihi']),
      );
}
