//todo YAPILACAK SAYFALAR
/*KullaniciAnaSayfaView -->     Emre +
KullaniciFavorilerView -->    Emre   +
AramaView -->            Emre
SatinAlmaView -->        Emre         +
YorumlarimView -->        Emre ---------------------yorum yapma view yapmamız lazım +++
SigninView yaptım ama hesap oluştur yok daha .
*/

//*Firebase kullanmak için en başta yüklemek zorunda olduğumuz, firebase'i initilize edebilmemize yarayan paket.
import 'package:firebase_core/firebase_core.dart';

//*Flutter'ın en çok kullandığı standart material kütüphanesi. Flutterla otomatik yüklü geliyor. Sadece import ediyoruz.
import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/screens/musteri/arama_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/favoriler_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/kategoriler_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/satinAlma_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/yorum_yapma_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/yorumlar_view.dart';
import 'package:idea_ecommerce_app/screens/sign_in.dart';
import 'package:idea_ecommerce_app/services/auth.dart';
import 'package:idea_ecommerce_app/widgets/on_board.dart';
import './screens/musteri/anaSayfa_view_model.dart';
import 'package:idea_ecommerce_app/services/database.dart';
import 'package:provider/provider.dart';

//*Firebase'i initialize ederken options kısmındaki komutu kullanmamızı sağlayan dosya. Firebase CLI sayesinde kuruyoruz. İşlem biraz uzun FlutterFire sitesinde ayrıntılı dökümanı var. Bu şekilde her platform için Firebase ayarlarını otomatik yapıyor.
import 'firebase_options.dart';

import 'screens/musteri/my_home_page.dart';

//*Firebase'in initialize edilmesi asenkron bir işlem olduğu için main fonksiyonunu async yapıyoruz. İnitialize yaparken de await ifadesi ile sistemi bekletiyoruz.
void main() async {
//*Buradaki komut daha program kurulmadan bir işlem yapılacaksa bunu bildirmek için yazılıyor. Eğer bu komutu yazmazsak program hata veriyor.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//*Widget ağacının en başına multiprovider ekledim bunun üzerinden istediğimiz şekilde state management ayarlamalarını yapabileceğiz.
  runApp(MultiProvider(
    providers: [
      Provider<Database>(
        create: (context) => Database(),
      ),
      Provider<Auth>(
        create: (context) => Auth(),
      ),
      ChangeNotifierProvider<AnasayfaViewModel>(
          create: ((context) => AnasayfaViewModel()))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDEA Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.black,
                onPrimary: Colors.black,
                textStyle: TextStyle(color: Colors.black))),
        textTheme: TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme:
            InputDecorationTheme(border: OutlineInputBorder()),
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 3),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.black.withOpacity(0.6)),
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
      ),
      home: Arama(),
    );
  }
}
