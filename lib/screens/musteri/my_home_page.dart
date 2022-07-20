import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/app_constants/app_strings.dart';
import 'package:idea_ecommerce_app/screens/musteri/kullanicisepet.dart';
import 'package:provider/provider.dart';
import '../../models/urun.dart';
import 'anaSayfa_view.dart';
import 'favoriler_view.dart';
import 'hesap_view.dart';
import 'kategoriler_view.dart';
import 'kullanicisepet_View_Model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//*index değişkeni tanımladım ve varsayılan olarak 0 belirledim. Böylece ilk ekran açıldığında anasayfa geliyor. Bu index değişimine göre sayfa geçişleri yapılacak.
  int index = 0;
  List<Widget> pages = [
    AnaSayfa(), Favoriler(), KullaniciSepetView(), Kategori(), Hesap(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//*index durumuna göre body olarak kullanılacak sayfayı belirleyen turnery kodu
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (secilenIndex) => setState(() => index = secilenIndex ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
//*Burada bottomnavigationbar da bulunacak tuşları ayarlıyoruz. items içine sırasıyla istediğimiz icon ve metinleri yazıyoruz. Aynı zamanda bu items içindeki elemanların indexi onTap deki secilenIndex oluyor ve ona göre ekran yeniden çiziliyor.
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "$navBarAnaSayfaText"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "$navBarFavorilerimText"),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  basketBadge()
                ]
              ),
            label: "$navBarSepetimText"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "$navBarKategorilerText"),
            BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "$navBarHesabimText"),
          ],
        ),
      ),
    );
  }

  Positioned basketBadge() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: 12,
        height: 12,
        child: Center(
          child:FutureBuilder<List<Urun>>(
                        future: Provider.of<KullaniciSepetViewModel>(context)
                            .sepetUrunVerisiOkuma(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.length.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 10),
                            );
                          } else {
                            return Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.40,
                                  height:
                                      MediaQuery.of(context).size.height * 0.40,
//*indicatorın boyutunu ayarlamak için transform scale kullanmak zorunda kaldım. Sizedbox bile işe yaramadı. Bu şekilde alana göre küçülttüm ve oldu.
                                  child: Transform.scale(
                                      scale: 0.3,
                                      child: CircularProgressIndicator())),
                            );
                          }
                        },
                      ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 0, 0)
        ),
      ),
    );
  }

}
