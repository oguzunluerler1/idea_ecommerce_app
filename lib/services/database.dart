import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  veriEklemeAdd() async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser['adSoyad'] = 'Tuğçe Burkay';
    _eklenecekUser['cinsiyet'] = "kadın";
    _eklenecekUser['adres'] = {'il': 'ankara', 'ilce': 'yenimahalle'};
    _eklenecekUser['renkler'] = FieldValue.arrayUnion(['mavi', 'yeşil']);
    _eklenecekUser['createdAt'] = FieldValue.serverTimestamp();
    await _firestore.collection('Customer').add(_eklenecekUser);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> urunVerisiOkuma(String path) async {
    var data = await _firestore.collection(path).get();

   /*  for (var product in data.docs) {
      print(product.data()["isim"]);
    } */

    return data;
  }

  Future<int> urunSayisi() async {
    var products = await _firestore.collection("Product").get();
    return products.docs.length;
  }
}
