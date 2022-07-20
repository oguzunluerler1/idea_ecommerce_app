import 'package:flutter/material.dart';
import '../../models/urun.dart';


class secilmisKategoriScreen extends StatefulWidget {
  const secilmisKategoriScreen({Key? key}) : super(key: key);
  @override
  State<secilmisKategoriScreen> createState() => _secilmisKategoriScreenState();
}

class _secilmisKategoriScreenState extends State<secilmisKategoriScreen> {
  List markaSecilenler = [];
  List filtreFiyatListesi = [
    {"min":0, "max":999999999},
    {"min":0, "max":50},
    {"min":50, "max":100},
    {"min":100, "max":200},
    {"min":200, "max":999999999},
  ];  
  int secilmisFiyatOpt = 0;
  List<Urun> filtreList = [];
  List <Urun> urunListesi = [];
  int selectedValuePop = 1;
  bool isChecked = false;
  List <Urun> sepetUrunleri = [];
  List <Urun> favorilenmisUrunler = [];
  List <Urun> tempUrunListesi = [
    Urun(isim: "a", kategori: ["PC"], marka: "marka1", stokMiktari: 1, satici: "satici1", fiyat: 10, puanOrt: 3.2, id: '1', urunResimleriUrl: []),
    Urun(isim: "b", kategori: ["PC"], marka: "marka2", stokMiktari: 5, satici: "satici2", fiyat: 22, puanOrt: 2.1, id: '2', urunResimleriUrl: []),
    Urun(isim: "c", kategori: ["PC"], marka: "marka1", stokMiktari: 2, satici: "satici3", fiyat: 333 ,puanOrt: 4.2, id: '3', urunResimleriUrl: [] ),
    Urun(isim: "d", kategori: ["PC"], marka: "marka4", stokMiktari: 3, satici: "satici4", fiyat: 2   ,puanOrt: 3.2, id: '4', urunResimleriUrl: [] ),
    Urun(isim: "e", kategori: ["PC"], marka: "marka5", stokMiktari: 3, satici: "satici56", fiyat: 11 ,puanOrt: 1.2, id: '5', urunResimleriUrl: [] ),
    Urun(isim: "f", kategori: ["PC"], marka: "marka6", stokMiktari: 2, satici: "satici6", fiyat: 212 ,puanOrt: 2.3, id: '6', urunResimleriUrl: [] ),
    Urun(isim: "g", kategori: ["PC"], marka: "marka7", stokMiktari: 4, satici: "satici7", fiyat: 52  ,puanOrt: 2.4, id: '7', urunResimleriUrl: [] ),
    Urun(isim: "h", kategori: ["PC"], marka: "marka8", stokMiktari: 1, satici: "satici8", fiyat: 1   ,puanOrt: 2.6, id: '8', urunResimleriUrl: [] ),
    Urun(isim: "i", kategori: ["PC"], marka: "marka2", stokMiktari: 2, satici: "satici9", fiyat: 23  ,puanOrt: 4.3, id: '9', urunResimleriUrl: [] ),
    Urun(isim: "j", kategori: ["PC"], marka: "marka1", stokMiktari: 2, satici: "satici10", fiyat: 104,puanOrt: 3.1, id: '10', urunResimleriUrl: [] ),
  ] ;
  bool favoriyeEklenmis = false;
  @override
  void initState() {
    urunListesi.addAll(tempUrunListesi);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(onTap: () {} ,child: Icon(Icons.search,color: Colors.purple,)), //TODO: Arama ekranına geçecek
          GestureDetector(onTap: () {} ,child: Icon(Icons.person, color: Colors.purple,)), //TODO: Profil ekranına geçilecek
        ],
        title: Text("PC (${urunListesi.length})", style: TextStyle(color: Colors.purple),),
        centerTitle: true,
      ),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return SingleChildScrollView(
      child: Column(
        children: [
          siralaFiltreleRowu(),
          gridMetodu(),
        ],
      ),
    );
  }

  GridView gridMetodu() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 2,
        ),
        itemCount: urunListesi.length,
        itemBuilder: (BuildContext context, int index) {
          Urun currentUrun = urunListesi[index];
          return Card(
            color: Colors.primaries[index%17].shade200,
            child: Column(
              children: [
                Expanded(child: FavoriIconu(currentUrun, index)),
                urunResimleri(index),
                Text("${urunListesi[index].isim}"),
                puanlamalarDegerlendirmesayisi(urunListesi[index]),
                fiyatlar(index),
                SepeteEkleMetod(index, context)
              ],
            ),
          );
        },
      );
  }

  ElevatedButton SepeteEkleMetod(int index, BuildContext context) {
    return ElevatedButton(onPressed: (){
                sepetUrunleri.add(urunListesi[index]); 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${urunListesi[index].isim} isimli ürün sepete eklendi.")));
                print("sepet listesi sepete girince görüntülenecek."); //TODO: sepet listesini sepetim sayfasına aktar
              }, child: Text("Sepete Ekle"));
  }

  Expanded urunResimleri(int index) {
    return Expanded(flex: 5,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://picsum.photos/150/100?random=$index",fit: BoxFit.cover,),
              ));
  }

  Expanded fiyatlar(int index) {
    return Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(alignment: Alignment.centerLeft,child: Text("${urunListesi[index].fiyat} TL")),
              ),);
  }

  Widget puanlamalarDegerlendirmesayisi(Urun urun) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
                  children: [
                    Text("${urun.puanOrt} "),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index+1 < urun.puanOrt ?
                          Icons.star
                          : Icons.star_border,
                          size: 18,
                        );
                      })
                    ),
                    Expanded(flex:2,child: Text("(100)")), //TODO: Degerlendirme sayısı eklenecek
                    Spacer(),
                  ],
                ),
    );
  }

  poplama () {
    showModalBottomSheet(context: context, builder: (context){
      return StatefulBuilder(
        builder: (context, setState) =>
        Column(
          children: [
            RadioListTile<int>(
              value: 1,
              groupValue: selectedValuePop, 
              onChanged: (value){
                setState(() {
                  selectedValuePop = value!;
                  siraYok();
                }); 
              },
              title: Text("Sıralama Yok"),
            ),          
            RadioListTile<int>(
              value: 2,
              groupValue: selectedValuePop, 
              onChanged: (value){
                setState(() {
                  selectedValuePop = value!;
                  artanSirala();
                }); 
              },
              title: Text("Artan Fiyat"),
            ),          
            RadioListTile<int>(
              value: 3,
              groupValue: selectedValuePop, 
              onChanged: (value){
                setState(() {
                  selectedValuePop = value!;
                  azalanSirala();
                }); 
              },
              title: Text("Azalan Fiyat"),
            ),          RadioListTile<int>(
              value: 4,
              groupValue: selectedValuePop, 
              onChanged: (value){
                setState(() {
                  selectedValuePop = value!;
                  puanSirala();
                }); 
              },
              title: Text("Yüksek Puan"),
            ),
          ],
        ),
      );
    });
  }

  void artanSirala () {
    urunListesi.sort(((a, b) {
      return a.fiyat.compareTo(b.fiyat);
    }));
    setState(() {
      
    });
  }

  void azalanSirala () {
    urunListesi.sort(((a, b) {
      return b.fiyat.compareTo(a.fiyat);
    }));
    setState(() {
      
    });
  }

  void puanSirala () {
    urunListesi.sort(((a, b) {
      return b.puanOrt.compareTo(a.puanOrt);
    }));
    setState(() {
      
    });
  }

  void siraYok () {
    urunListesi = [];
    urunListesi.addAll(tempUrunListesi);
    setState(() {
      
    });
  }

  GestureDetector FavoriIconu(Urun currentUrun, int index) {
    return GestureDetector( onTap: () {setState(() {
                if (favorilenmisUrunler.contains(currentUrun)){ 
                  favorilenmisUrunler.remove(currentUrun); //TODO: favorilerden çıkartılacak
                }
                else favorilenmisUrunler.add(urunListesi[index]); //TODO: favorilere eklenecek
              });} , child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment: Alignment.topRight,child: Icon(!favorilenmisUrunler.contains(currentUrun) ? Icons.favorite_border : Icons.favorite)),
              ));
  }

  Widget siralaFiltreleRowu() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 60,
        child: Card(
          color: Colors.grey.shade200,
          elevation: 10,
          child: Row(
              children: [
                Spacer(),
                Expanded(flex: 1 ,child: GestureDetector(onTap: (){},child: shareButonu())), //TODO: Paylaşma ekranı açılacak
                Spacer(),
                Expanded(flex: 2 , child: GestureDetector(onTap: (){poplama();},child: siralaButonu())),
                Spacer(),
                Expanded(flex: 2 , child: GestureDetector(onTap: (){filtre();},child: filtrelemeButonu())),
                Spacer()
              ],
            ),
        ),
      ),
    );
  }

  Widget filtrelemeButonu() {
    return Row(
      children: [
        Icon(Icons.filter_alt_rounded),
        Text(" Filtrele"),
      ],
    );
  }

  Widget siralaButonu() {
    return Row(
      children: [
        Icon(Icons.compare_arrows_sharp),
        Text(" Sırala"),
      ],
    );
  }

  Widget shareButonu() => Icon(Icons.ios_share);

  filtre() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => 
            Column(
              children: [
                Spacer(),
                Divider(
                  color: Colors.grey,
                  indent: MediaQuery.of(context).size.width*0.35,
                  endIndent: MediaQuery.of(context).size.width*0.35,
                  thickness: 2,
                ),
                Spacer(),
                TextButton(onPressed: (){markaDialog();}, child: Text("Markalar")),
                TextButton(onPressed: (){fiyatDialog();}, child: Text("Fiyat Aralığı")),
                Spacer(flex: 3,),
                ElevatedButton  (onPressed: (){
                  if (markaSecilenler.isNotEmpty){
                    filtreList = tempUrunListesi.where((e) => markaSecilenler.contains(e.marka)).toList();
                  }  
                  else {
                    filtreList = tempUrunListesi;
                  }               
                  urunListesi = filtreList.where((e) => e.fiyat >= filtreFiyatListesi[secilmisFiyatOpt]["min"] && e.fiyat <= filtreFiyatListesi[secilmisFiyatOpt]["max"]).toList();
                  setState((){ });
                  Navigator.pop(context);
                }, child: Text("Filtreleri Uygula")),
                Spacer(flex: 2,),
              ],
            ),
        );
      }
    ).whenComplete(() => setState((){ }));
  }

  void fiyatDialog () {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  secilmisFiyatOpt = 1;setState(() {
                    
                  });
                }, child: Text("0 - 50 TL arası ", style: TextStyle(color: secilmisFiyatOpt==1 ? Colors.green : null),)),
                secilmisFiyatOpt == 1? Icon(Icons.done) : SizedBox.shrink()
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  secilmisFiyatOpt = 2;setState(() {
                    
                  });
                }, child: Text("50 - 100 TL arası", style: TextStyle(color: secilmisFiyatOpt==2 ? Colors.green : null),)),
                secilmisFiyatOpt == 2? Icon(Icons.done) : SizedBox.shrink()
              ],
            ),      
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  secilmisFiyatOpt = 3;setState(() {
                    
                  });
                }, child: Text("100 - 200 TL arası", style: TextStyle(color: secilmisFiyatOpt==3 ? Colors.green : null),)),
                secilmisFiyatOpt == 3? Icon(Icons.done) : SizedBox.shrink()
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  secilmisFiyatOpt = 4;setState(() {
                    
                  });
                },
                child: Text("200 TL üzeri", style: TextStyle(color: secilmisFiyatOpt==4 ? Colors.green : null),)),
                secilmisFiyatOpt == 4? Icon(Icons.done) : SizedBox.shrink()
              ],
            ),
            TextButton(onPressed: (){
              Navigator.pop(context);
              secilmisFiyatOpt = 0;setState(() {
              });
            }, child: Text("Filtreyi kaldır")),
          ],
        ),
        );
      }
    );
  }
  
  void markaDialog () {
    var markalar = tempUrunListesi.map((e) => e.marka).toSet().toList();
    showDialog(
      context: context, 
      builder: (context) {
        return Column(
          children: [
            AlertDialog(
              content: Column(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) =>
                    Column(
                      children: markalar.map(
                        (e) => CheckboxListTile(
                          title: Text(e),
                          value: markaSecilenler.contains(e), 
                          onChanged: (value){
                            !markaSecilenler.contains(e) ? 
                            markaSecilenler.add(e)
                            : markaSecilenler.remove(e);
                            setState(() {
                              
                            },);
                          }
                        )
                      ).toList()
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Seçimleri tamamla"))
                ]
              )
            ),
          ],
        );
      }
    );
  }
}