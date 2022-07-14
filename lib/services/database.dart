import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  userEkleme({required String uid, required String mail}) async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser['uid'] = uid;
    _eklenecekUser['mail'] = mail;
//*Burada .doc() diyerek document adını kendimiz belirliyoruz. Yoksa kendisi uniqe bir ad tanımlıyor. uid diyerek de auth tarafından oluşturulan user idyi vermiş olduk. set ile de map vererek girilecek verileri girdik. doc adı ile uid aynı olması karışıklık yaratmaması açısından çok mantıklı oldu bence.
    await _firestore.collection('Customer').doc(uid).set(_eklenecekUser);
  }

  veriEklemeAdd() async {
    Map<String, dynamic> _eklenecekUser = <String, dynamic>{};
    _eklenecekUser['adSoyad'] = 'Tuğçe Burkay';
    _eklenecekUser['cinsiyet'] = "kadın";
    _eklenecekUser['adres'] = {'il': 'ankara', 'ilce': 'yenimahalle'};
    _eklenecekUser['renkler'] = FieldValue.arrayUnion(['mavi', 'yeşil']);
    _eklenecekUser['createdAt'] = FieldValue.serverTimestamp();
    await _firestore.collection('Customer').add(_eklenecekUser);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> urunVerisiOkuma(
      String path) async {
    var data = await _firestore.collection(path).get();
    return data;
  }

  Future<int> urunSayisi() async {
    var products = await _firestore.collection("Product").get();
    return products.docs.length;
  }
}
