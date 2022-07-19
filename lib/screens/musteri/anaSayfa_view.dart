//todo Son gezilen ürünler tamam. Diğer ikisi genel ürünleri çekiyor üzerlerinde oynama yapabilirim.
//todo SepeteEkle tuşunu aktive etmem lazım.
//todo Reklam panosunu halletmem lazım.
import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/app_constants/app_strings.dart';
import 'package:idea_ecommerce_app/models/urun.dart';
import 'package:idea_ecommerce_app/screens/musteri/arama_view.dart';
import 'package:idea_ecommerce_app/screens/musteri/urun_ekrani_view.dart';
import 'package:idea_ecommerce_app/screens/sign_in.dart';
import 'package:idea_ecommerce_app/services/auth.dart';
import 'anaSayfa_view_model.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [ logOutButton(context), ],
      ),
      body: _bodyView(context),
    );
  }

  Text appBarTitle() {
    return Text(
      '$homePageAppTitle',
      style:TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
    );
  }

  IconButton logOutButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Provider.of<Auth>(context, listen: false).signOut();
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignIn(),));
      },
      icon: Icon(Icons.logout, color: Colors.black.withOpacity(0.6)),
    );
  }

  Widget _bodyView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            searchTextField(context),
            SizedBox(height: 10),
            reklamPanosu(context: context, imageUrl: "$reklamPanoImageUrl"),
            SizedBox(height: 20),
            sectionTitle(text: populerUrunlerText),
            SizedBox(height: 10),
            //todo Buradaki futurebuilder şu an için databasedeki bütün ürünlerin bilgisini çekiyor. Normalde popüler ürünleri bir şekilde belirleyip onları çekmesi lazım. Alt taraftakilerde de son gezilen ürünler veya sizin için seçtiklerimiz tarzı listelerden seçmesi lazım.
            //*Providerın farklı bir kullanım formatını kullandık aşağıda.
            productFutureBuilder(context: context, future: context.watch<AnasayfaViewModel>().tumUrunVerisiOkuma()),
            sectionTitle(text: sonGezilenUrunlerText),
            SizedBox(height: 10),
            productFutureBuilder(context: context,future: Provider.of<AnasayfaViewModel>(context).tiklananUrunVerisiOkuma()),
            sectionTitle(text: sizinIcinSectikText),
            SizedBox(height: 10),
            productFutureBuilder(context: context, future: Provider.of<AnasayfaViewModel>(context).tumUrunVerisiOkuma()),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  TextField searchTextField(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: ((context) => Arama())));
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: searchHintText,
      ),
    );
  }

  Center reklamPanosu({required BuildContext context, required String imageUrl}) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
        //todo Burada reklam panosuna geçici bir resim ekledim url koyarak. Normalde adminler tarafından belirlenen kampanyaların resimlerini koyucaz ve gesturededector ile farklı resimlere geçmelerini veya tıklayarak ilgili kampanya ürünlerini görmelerini sağlayacağız.
          image: DecorationImage(image: NetworkImage('$imageUrl'), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black54),
        ),
      ),
    );
  }

  Text sectionTitle({required String text}) {
    return Text(
    "$text", 
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Color.fromARGB(255, 40, 2, 104),
      fontWeight: FontWeight.bold),
    );
  }

  FutureBuilder<List<Urun>> productFutureBuilder({required BuildContext context, Future<List<Urun>>? future}) {
    return FutureBuilder<List<Urun>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) return productGridView(context, snapshot);
        else return loading(context);
      }
    );
  }

  SizedBox productGridView(BuildContext context, AsyncSnapshot<List<Urun>> snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.builder(
        itemCount: snapshot.data?.length ?? 0,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return productColumn(context, snapshot, index);
        },
      ),
    );
  }

  Column productColumn(BuildContext context, AsyncSnapshot<List<Urun>> snapshot, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        productContainer(
          context: context, imageUrl: snapshot.data?[index].urunResimleriUrl[0], 
          onTap: () => goToProductDetail(context: context, urun: snapshot.data![index])
        ),
        productLabel(context: context, text: snapshot.data?[index].fiyat.toString() ?? ''),
        productLabel(context: context, text: snapshot.data?[index].isim ?? ''),
        addBasketButton(),
      ],
    );
  }

  void goToProductDetail({required BuildContext context,required Urun urun}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => urunEkrani(urun)));
  }

  Widget productContainer({required BuildContext context, required String imageUrl,required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.25,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: imageBorder(),
        child: productImage(url: imageUrl)
      ),
    );
  }

  BoxDecoration imageBorder() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.black54,
      ),
    );
  }

  Image productImage({required String url}) {
    return Image.network(
      url,
      errorBuilder: (context, error, stackTrace) => Icon(Icons.error_outline),
    );
  }

  Text productLabel({required BuildContext context, required String text}) {
    return Text(text, style:Theme.of(context).textTheme.headline6);
  }
  //tood ya widget olarak çıkarılır opressed dışardan verilir ya da parametre geçilir
  Expanded addBasketButton() {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        child: Text(sepeteEkleText)
      ),
    );
  }

  Center loading(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.height * 0.40,
          height: MediaQuery.of(context).size.height * 0.40,
        //*indicatorın boyutunu ayarlamak için transform scale kullanmak zorunda kaldım. Sizedbox bile işe yaramadı. Bu şekilde alana göre küçülttüm ve oldu.
          child: Transform.scale(
              scale: 0.3,
              child: CircularProgressIndicator())),
    );
  }

}
