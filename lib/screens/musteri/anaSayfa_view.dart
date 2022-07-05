import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/models/urun.dart';
import 'anaSayfa_view_model.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ecommerce App",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
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
                "Popüler Ürünler",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 2, 104),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<Urun>>(
                  future: Provider.of<AnasayfaViewModel>(context).veriOkuma(),
                  builder: (centext, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5,
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
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
                                ),
                                Text(
                                    snapshot.data?[index].fiyat.toString() ??
                                        '',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text(snapshot.data?[index].isim ?? '',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Sepete Ekle")),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sizin İçin Seçtiklerimiz",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 2, 104),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GridView.builder(
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        Text("Fiyatı",
                            style: Theme.of(context).textTheme.headline6),
                        Text("ismi",
                            style: Theme.of(context).textTheme.headline6),
                        OutlinedButton(
                            onPressed: () {}, child: Text("Sepete Ekle")),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                //width: MediaQuery.of(context).size.height * 0.3,
                child: GridView.count(
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                        Text("Fiyatı",
                            style: Theme.of(context).textTheme.headline6),
                        Text("ismi",
                            style: Theme.of(context).textTheme.headline6),
                        OutlinedButton(
                            onPressed: () {}, child: Text("Sepete Ekle")),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              OutlinedButton(
                onPressed: () {
                  Provider.of<AnasayfaViewModel>(context, listen: false)
                      .veriEkleme();
                  Provider.of<AnasayfaViewModel>(context, listen: false)
                      .veriOkuma();
                },
                child: Text('Veri Ekleme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
