import 'package:flutter/material.dart';

import '../../models/urun.dart';

class urunEkrani extends StatefulWidget {
  urunEkrani(this.urun, {Key? key}) : super(key: key);

  Urun urun;

  @override
  State<urunEkrani> createState() => _urunEkraniState();
}

class _urunEkraniState extends State<urunEkrani> {
  bool kalpbos = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Detayı'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        /* actions: [
          GestureDetector(
              onTap: () {
                print('favorilerim sayfasına gidecek');
              },
              child: Icon(Icons.favorite)), 
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  print('sosyal medya sekmelerini gösterek');
                },
                child: Icon(Icons.share_rounded)),
          ), 
        ], */
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: NetworkImage(widget.urun.urunResimleriUrl[0])),
            ListTile(
              title: Text(
                widget.urun.marka,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple),
              ),
              subtitle: Text(widget.urun.isim),
            ),
            /* Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.2),
                  child: Text(
                    'Bluetooth Versiyon    5.0',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                Text(
                  'Tümü',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.purple[400]),
                ),
                GestureDetector(
                    onTap: () {
                      print('Ürün özellikleri sayfasına gidecek');
                    },
                    child: Icon(Icons.arrow_forward_ios_sharp,
                        size: 14, color: Colors.purple[800])),
              ],
            ),
  */
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.2),
                  child: Text(
                    '4.8',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.star, size: 14, color: Colors.yellow[400]),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 130.0),
                  child: GestureDetector(
                      onTap: () {
                        print('değerlendirme sayfasına girecek');
                      },
                      child: Text(
                        'Tüm Değerlendirmeler(12276)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.purple),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Satıcı',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        print('anasayfaya dönecek');
                      },
                      child: Text(
                        'E-ticaret',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.purple[800]),
                      )),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('satıcıya sor'),
              style: ElevatedButton.styleFrom(primary: Colors.purple[400]),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Ürün Açıklamaları',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print('ürün açıklamaları sayfasına gidecek');
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Ürün Özellikleri',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print('ürün özellikleri sayfasına gidecek');
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Kampanyalar',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print('kampanyalar sayfasına gidecek');
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Soru&Cevap',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print('soru&cevap sayfasına gidecek');
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('İptal Ve iade Koşulları',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          print('iptal ve iade koşullarına gidecek');
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text('2.299,01 TL'),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print('favorilere ekle');
                    setState(() {
                      kalpbos = !kalpbos;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: kalpbos
                        ? Icon(Icons.favorite_border)
                        : Icon(Icons.favorite),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print('sepete ekleme butonu');
                    },
                    child: Text('sepete ekle')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
