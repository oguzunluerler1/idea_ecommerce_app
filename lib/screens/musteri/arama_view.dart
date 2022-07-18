import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/urun.dart';
import 'anaSayfa_view_model.dart';

class Arama extends StatelessWidget {
  const Arama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Arama Ekranı',
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Ürün veya Satıcı ismi girerek arayınız."),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Geçmiş Aramalar',
              style:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
//todo Row olarak yaptım ama çok fazla sayı olduğunda satıra sığmahyınca sıkıntı olur. Aslında Gridview olarak da yaplabilirdi.
            Row(
              children: [
                OutlinedButton(onPressed: () {}, child: Text('Diş Fırçası')),
                OutlinedButton(onPressed: () {}, child: Text('Diş Macunu')),
                OutlinedButton(onPressed: () {}, child: Text('Televizyon')),
                OutlinedButton(onPressed: () {}, child: Text('Çanta')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Urun>>(
                future: Provider.of<AnasayfaViewModel>(context)
                    .tumUrunVerisiOkuma(),
                builder: (centext, snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: GridView.builder(
                        itemCount: snapshot.data?.length,
                        //shrinkWrap: true,
                        //scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .75,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
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
                      ),
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
          ],
        ),
      ),
    );
  }
}
