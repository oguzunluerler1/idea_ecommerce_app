
import 'package:flutter/material.dart';
import 'ana_sayfa.dart';
import 'favoriler.dart';
import 'hesap.dart';
import 'kategoriler.dart';
import 'sepet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: index == 0
            ? AnaSayfa()
            : index == 1
                ? Favoriler()
                : index == 2
                    ? Sepet()
                    : index == 3
                        ? Kategoriler()
                        : Hesap(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (secilenIndex) {
            setState(() {
              index = secilenIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          //selectedItemColor: Colors.blue,
          //fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfam"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorilerim"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Sepetim"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Kategoriler"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Hesabım"),
          ],
        ),
      ),
    );
  }
}
