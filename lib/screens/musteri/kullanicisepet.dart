import 'package:flutter/material.dart';

class sepetim extends StatefulWidget {
  const sepetim({Key? key}) : super(key: key);
  @override
  State<sepetim> createState() => _sepetimState();
}

class _sepetimState extends State<sepetim> {
  bool? _checked = true;
  int? _urunSayiDegiskeni = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bodyMethod(),
      ),
    );
  }

  Widget bodyMethod() {
    return Column(
      children: [
        enUstKutuSepetimBaslikli(),
        saticiKargoListTile(),
        alisverisTamamla(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                urunListTile(),
                urunListTile(),
                urunListTile(),
                urunListTile(),
                urunListTile(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container alisverisTamamla() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.1), top: BorderSide(width: 0.5))),
      height: 80,
      width: double.infinity,
      child: ListTile(
        title: Column(
          children: [
            Spacer(),
            Text("Seçilen Ürünler (3)"),
            Text(
              "82,70 TL",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Kargo bedeli = 0 TL"),
            Spacer(),
          ],
        ),
        trailing: Column(
          children: [
            Spacer(),
            Text(
              "Toplam: 82,70 TL",
              style: TextStyle(fontSize: 11),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                print(
                    "Ödeme ekranına, kayıtlı kart ve adreslere sırayla gidecek");
              },
              child: Container(
                  decoration:
                      BoxDecoration(color: Colors.orange, border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ödemeyi Tamamla"),
                  )),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget urunListTile() {
    return Visibility(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Column(
              children: [
                CheckboxListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/canta.jpg",
                              fit: BoxFit.contain,
                            )),
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            Text(
                              "XX Marka El Çantası",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "En geç 20 temmuz Çarşamba günü kargoda",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                              width: 1,
                            ),
                            Text("35.90 TL")
                          ],
                        ),
                      )
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _urunSayiDegiskeni = (_urunSayiDegiskeni! + 1);
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 18,
                          )),
                      Text("$_urunSayiDegiskeni",
                          style: TextStyle(fontSize: 12)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _urunSayiDegiskeni = _urunSayiDegiskeni! - 1;
                            });
                          },
                          child: Icon(Icons.remove))
                    ],
                  ),
                  value: _checked,
                  onChanged: (bool? value) {
                    setState(() {
                      _checked = value;
                    });
                  },
                ),
                GestureDetector(
                    onTap: () {
                      print("ilişkili ürünün linkine gidecek");
                    },
                    child: Text("Ürün ayrıntıları")),
              ],
            ),
          ),
        ),
        visible: _urunSayiDegiskeni! <= 0 ? false : true);
  }

  Container saticiKargoListTile() {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
      height: 70,
      width: double.infinity,
      child: ListTile(
        title: GestureDetector(
          onTap: () {
            print("Satıcıya yönlendirme butonu");
          },
          child: Row(
            children: [
              Text("Satıcı: "),
              Text(
                "Doğan Burda",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_right_rounded),
            ],
          ),
        ),
        subtitle: Row(
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.orange),
                Text(
                  " Kargo Bedava",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container enUstKutuSepetimBaslikli() {
    return Container(
      width: double.infinity,
      height: 160,
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListTile(
                  title: Text(
                    "Sepetim",
                    style: TextStyle(fontSize: 30),
                  ),
                  subtitle: Text("(3 ürün)"),
                  trailing: GestureDetector(
                      onTap: () {
                        print("Buradan kuponlara gidecek");
                      },
                      child: Text(
                        "Kuponlarım/İndirim kodu",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        print("seçilmiş olanlar kaldırılacak yani untick");
                      },
                      child: Text(
                        "Seçimleri kaldır",
                        style: TextStyle(color: Colors.purple),
                      )),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        print("seçilmiş olanlar listeden çıkarılacak");
                      },
                      child: Text(
                        "Seçilenleri sil(3)",
                        style: TextStyle(color: Colors.purple),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
