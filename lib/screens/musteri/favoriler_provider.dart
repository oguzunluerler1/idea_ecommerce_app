import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/models/urun.dart';

import '../../services/auth.dart';

class FavorilerProvider extends ChangeNotifier {

  List<Urun> _favoriUrunler = [];
  List _favoritedProductIds = [];

  Auth _auth = Auth();

  get getfavoriUrunler => _favoriUrunler;

   Future<List<Urun>> futureGet() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection("Product").get();
    List<Urun> docSnap = data.docs.map((e) => Urun.fromMap(e.data())).toList();
    docSnap.shuffle();
    return docSnap;
  }
  
  void getFavorites() async {
    var uid = _auth.onlineUser()?.uid;
    var response = await FirebaseFirestore.instance.collection("Customer").doc(uid).get().then((value) => value.data()?["favoriler"]);
    _favoritedProductIds = response;
    await _getFavoriteProducts(_favoritedProductIds);
    notifyListeners();
  }

  Future<void> _getFavoriteProducts(List favoritedProductIds) async {
    var response = await FirebaseFirestore.instance.collection("Product").get();
    var data = response.docs.map((e) => e.data()).toList();
    _favoriUrunler = data.map((e) => Urun.fromMap(e)).toList();
    var anan = _favoriUrunler.where((e) => favoritedProductIds.contains(e.id));
    for (var element in anan) {
      print(element.isim);
    }
  }

}