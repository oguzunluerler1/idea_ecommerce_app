import 'package:flutter/material.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  int selectedIndexSolTaraf = 0;
  int degisken = 0;
  int index = -1;
  int index2 = -1;
  List<String> solkategorilerlistesi = [
    "Sana özel",
    "Popüler",
    "Telefon",
    "Beyaz eşya",
    "Ev aleti",
    "Moda",
    "Spor",
    "Anne-bebek",
    "Süpermarket",
    "Petshop",
  ];
  List<String> sagkategorilerlistesiUst = [
    "Çizgi Roman",
    "Araştırma",
    "Hobi",
    "Dijital yayınlar",
    "Dergi",
    "Din ve mitoloji",
    "Termoslar",
    "Bellek",
    "Saklama",
    "PC",
    "Sağlık ürünleri",
    "Şarj cihazları",
    "Kılıflar",
    "Mouse",
    "Giyim ve ekipman",
    "Elektrikli alet",
    "Manuel alet",
    "Kuru gıda",
    "Oyuncu koltuğu",
    "Baharat",
    "Kupalar",
  ];
  List<String> sagkategorilerlistesiAlt = [
    "Android Telefonlar",
    "Giyim",
    "Kampçılık",
    "PC malzemeleri",
    "Sofra",
    "Ayakkabı",
    "Yemek",
    "Saç bakım",
    "Erkek ayakkabı",
    "Cilt bakım",
    "Oto aksesuar",
    "Iphone",
    "Süpürgeler",
    "Gıda takviyeleri",
    "Laptop",
    "Makyaj",
    "Hırdavat",
    "Edebiyat",
    "Pişirme",
    "Kadın",
    "Kablosuz kulaklık",
  ];
  @override
  Widget build(BuildContext context) {
    sifirla();
    return SafeArea(
      child: Scaffold(
        body: bodyMethod(),
      ),
    );
  }

  Widget bodyMethod() {
    return Column(
      children: [UstKutu(), AltKutu()],
    );
  }

  SizedBox UstKutu() {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ürün, kategori veya marka ara",
                prefixIcon: Icon(
                  Icons.search,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    print("burada kameraya gidecek");
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(border: Border.all(width: 0.2)),
          ),
        ),
      ),
    );
  }

  Expanded AltKutu() {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            SoldakiAsagiKaydirilanSecenek(),
            SagdakiAsagiKaydirilanSecenek(),
          ],
        ),
        width: double.infinity,
      ),
    );
  }

  Expanded SagdakiAsagiKaydirilanSecenek() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            seninIcinSectik(),
            GridMetodu(sagkategorilerlistesiUst),
            EnCokBakilanlar(),
            GridMetodu(sagkategorilerlistesiAlt),
          ],
        ),
      ),
    ));
  }

  Padding EnCokBakilanlar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            "En çok bakılanlar",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.red),
          )),
    );
  }

  GridView GridMetodu(List<String> ilkGirenListe) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 20,
        ),
        itemCount: 21,
        itemBuilder: (context, indexx) {
          return kategoriCardSagTaraf(indexx, ilkGirenListe);
        });
  }

  Padding seninIcinSectik() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            "Senin için seçtik",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.red),
          )),
    );
  }

  Widget kategoriCardSagTaraf(int index2, List<String> girenListe) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                print("buraya sayfa gelecek(iç)");
              },
              child: SizedBox(
                width: 80,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "https://picsum.photos/id/$index2/40/60",
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            ),
          ),
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text("${girenListe.elementAt(index2)}")),
        ],
      ),
    );
  }

  SizedBox SoldakiAsagiKaydirilanSecenek() {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              children: List.generate(10, (index) => InkWellMetodu(index))),
        ),
      ),
    );
  }

  void sifirla() {
    degisken = 0;
    index = -1;
    index2 = -1;
  }

  InkWell solkolonInkWell() {
    return InkWell(
      child: Ink(child: solkolondegiskenarttirilmis()),
      onTap: () {
        print("buraya ekran linki gelecek");
      },
    );
  }

  Widget InkWellMetodu(int inkIndex) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color:
                  inkIndex == selectedIndexSolTaraf ? Colors.red : Colors.white,
              width: inkIndex == selectedIndexSolTaraf ? 2 : 0),
          borderRadius: BorderRadius.circular(12)),
      elevation: 10,
      child: InkWell(
        onTap: () {
          print("buraya sayfa gelecek");
          setState(() {
            selectedIndexSolTaraf = inkIndex;
          });
        },
        child: Ink(
          child: solkolondegiskenarttirilmis(),
          width: 70,
          height: 100,
        ),
      ),
    );
  }

  Widget solkolondegiskenarttirilmis() {
    degisken++;
    index++;
    return kategoriCardSolKolon(degisken, index);
  }

  Widget kategoriCardSolKolon(int degisken, int index) {
    return SizedBox(
        child: Column(children: [
      Spacer(),
      Image.network("https://picsum.photos/id/$degisken/40/40"),
      Spacer(),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("${solkategorilerlistesi.elementAt(index)}")),
      ),
      Spacer(),
    ]));
  }
}
