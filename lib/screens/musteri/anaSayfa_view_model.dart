import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/models/urun.dart';
import 'package:idea_ecommerce_app/services/database.dart';

class AnasayfaViewModel extends ChangeNotifier {
  Database _database = Database();

  veriEkleme() async {
    _database.veriEklemeAdd();
  }

  Future<List<Urun>> veriOkuma() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await _database.urunVerisiOkuma('Product');

    List<Urun> docSnap = data.docs.map((e) => Urun.fromMap(e.data())).toList();

    return docSnap;
  }

  /* Future<QuerySnapshot<Map<String, dynamic>>> veriOkuma() async {
    return _database.urunVerisiOkuma();
  } */

  Future<int> urunSayisi() async {
    return _database.urunSayisi();
  }
}
