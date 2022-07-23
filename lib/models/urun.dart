//todo Oğuz eğer bunu görüyorsan güncel halini indirmişsin demektir:)))22 07 2022 2330

//todo Urun açıklamaları, Urun Özellikleri

class Urun {
  final String id;
  final String isim;
  final List<dynamic> kategori;
  final String marka;
  final int stokMiktari;
  final String satici; //todo normalce seller tipinde sonra bakıcam
  final int fiyat;
  final List<dynamic> urunResimleriUrl;
  final double puanOrt;
  final String urunAciklamasi;
  final String urunOzellikleri;
  final String kategoriId;
  final int degsayisi;

  Urun(
      {required this.id,
      required this.urunResimleriUrl,
      required this.isim,
      required this.kategori,
      required this.marka,
      required this.stokMiktari,
      required this.satici,
      required this.fiyat,
      this.puanOrt = 0,
      required this.urunAciklamasi,
      required this.urunOzellikleri,
      required this.kategoriId,
      this.degsayisi = 0,
    });
    //TODO: degsayisi buglu neden bilmiyorum ama şu an hata veriyor required yaptığımda. Bakıcam
  //TODO: puan ortalaması şu an direkt olarak default değer alıyor. ona göre bunu yapacaksak daha sonra required yapıp tüm programdaki fonksiyonlara onun da atanması lazım.

  Map<String, dynamic> toMap() => {
        'id': id,
        'urunResimleriUrl': urunResimleriUrl,
        'isim': isim,
        'kategori': kategori,
        'marka': marka,
        'stokMiktari': stokMiktari,
        'satici': satici,
        'fiyat': fiyat,
        'puanOrt': puanOrt,
        'urunAciklamasi': urunAciklamasi,
        'urunOzellikleri': urunOzellikleri,
        'kategoriId' : kategoriId,
        'degsayisi' : degsayisi,
      };

  factory Urun.fromMap(Map<String, dynamic> map) => Urun(
        id: map['id'],
        isim: map['isim'],
        kategori: map['kategori'],
        marka: map['marka'],
        stokMiktari: map['stokMiktari'],
        satici: map['satici'],
        fiyat: map['fiyat'],
        puanOrt: map['puanOrt'].toDouble(),
        urunResimleriUrl: map['urunResimleriUrl'],
        urunAciklamasi: map['urunAciklamasi'],
        urunOzellikleri: map['urunOzellikleri'],
        kategoriId : map['kategoriId'],
        degsayisi: map  ['degsayisi'],
      );
}
