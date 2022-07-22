import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/screens/musteri/yeni_adres_olustur.dart';

class adreslerim extends StatefulWidget {
  const adreslerim({Key? key}) : super(key: key);

  @override
  State<adreslerim> createState() => _adreslerimState();
}

class _adreslerimState extends State<adreslerim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adreslerim'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'YENİ ADRES OLUŞTUR',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YeniAdresOlustur(),
                            ));
                        print('yeni adres oluştur sayfasına gidecek');
                      },
                      child: Icon(Icons.add_circle_outline)),
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text('İŞ'),
                  subtitle:
                      Text('Lavinya sokak,Beşiktaş,no:34,İstanbul/Türkiye '),
                  trailing: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          print('adres düzenleme sayfasına gidecek');
                        },
                        child: Icon(Icons.edit_location_alt_outlined)),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text('EV'),
                      subtitle: Text(
                          'Lavinya sokak,Beşiktaş,no:34,İstanbul/Türkiye '),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              print('adresi düzenleme sayfasına gidecek');
                            },
                            child: Icon(Icons.edit_location_alt_outlined)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
