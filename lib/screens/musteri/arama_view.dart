import 'package:flutter/material.dart';
import 'arama_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/urun.dart';

class Arama extends StatefulWidget {
  const Arama({Key? key}) : super(key: key);

  @override
  State<Arama> createState() => _AramaState();
}

TextEditingController arama = TextEditingController();

class _AramaState extends State<Arama> {
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
              onChanged: (value) {
                setState(() {});

                //Provider.of<AramaViewModel>(context).arama(value);
              },
              controller: arama,
              autofocus: true,
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
            FutureBuilder<List<dynamic>?>(
                future: Provider.of<AramaViewModel>(context, listen: false)
                    .gecmisBilgisi(),
                builder: (centext, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        //shrinkWrap: true,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .4,
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                snapshot.data![index],
                              ));
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                          width: MediaQuery.of(context).size.height * 0.20,
                          height: MediaQuery.of(context).size.height * 0.20,
                          //*indicatorın boyutunu ayarlamak için transform scale kullanmak zorunda kaldım. Sizedbox bile işe yaramadı. Bu şekilde alana göre küçülttüm ve oldu.
                          child: Transform.scale(
                              scale: 0.3, child: CircularProgressIndicator())),
                    );
                  }
                }),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Urun>>(
                future: Provider.of<AramaViewModel>(context, listen: false)
                    .arama(arama.text),
                builder: (centext, snapshot) {
                  print(arama.text);
                  if (snapshot.hasData) {
                    return Expanded(
                      child: GridView.builder(
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
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  child: Image(
                                      image: NetworkImage(snapshot.data?[index]
                                              .urunResimleriUrl[index] ??
                                          '')),
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
