import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/urun.dart';
import 'anaSayfa_view_model.dart';

class Favoriler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favoriler",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
//todo Burada favori listesindeki ürünleri getirecek şekilde ayarlama yapıcaz. Ayrıca Bir de favori ürünü listeden çıkarmak için buton yapmak lazım.
        child: FutureBuilder<List<Urun>>(
            future: Provider.of<AnasayfaViewModel>(context).veriOkuma(),
            builder: (centext, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  //shrinkWrap: true,
                  //scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    //childAspectRatio: 1.5,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Container(
                              width: MediaQuery.of(context).size.height * 0.25,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              child: IconButton(
//todo Burada kalp icon buttonına basıldığında sayfa yenilenecek ve o ürün kaldırılacak. Aynı zamanda müşterinin favori listesi de güncellenerek bahse konu ürün oradaki databaseden de silinerek güncellenecek.
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  )),
                            )
                          ]),
                        ),
                        Text(snapshot.data?[index].fiyat.toString() ?? '',
                            style: Theme.of(context).textTheme.headline6),
                        Text(snapshot.data?[index].isim ?? '',
                            style: Theme.of(context).textTheme.headline6),
                        OutlinedButton(
                            onPressed: () {}, child: Text("Sepete Ekle")),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Container(
                      width: MediaQuery.of(context).size.height * 0.40,
                      height: MediaQuery.of(context).size.height * 0.40,
//*indicatorın boyutunu ayarlamak için transform scale kullanmak zorunda kaldım. Sizedbox bile işe yaramadı. Bu şekilde alana göre küçülttüm ve oldu.
                      child: Transform.scale(
                          scale: 0.3, child: CircularProgressIndicator())),
                );
              }
            }),
      ),
    );
  }
}
