import 'package:flutter/material.dart';

class kullanicihesabiview extends StatelessWidget {
  const kullanicihesabiview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500 ),),
          centerTitle: true,
          backgroundColor: Colors.purple,
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          child: Column( 
            children: [  
            Image.asset('imagess/profile.jpg' , height: 150, width: 100),
            Text('Metin Çiçek', style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            GestureDetector (
              onTap: () {
                print('siparişlerime gidecek', );
              },
              child:Card(
              elevation: 50,
              child: SizedBox(height: 55, width: double.infinity, child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_basket),
                  ),
                  Text('Siparişlerim',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                ],
              )), 
              ),
            ),
            GestureDetector( 
              onTap: () {
                print('cüzdanıma gidecek');
              },
              child:Card(
                elevation:50,
              child: SizedBox(height: 55, width: double.infinity, child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.wallet),
                  ),
                  Text(('Cüzdanım'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ],
              )),
              ),
            ), 
            GestureDetector( 
              onTap: () {
                print('favorilerime gidecek');
              },
              child:Card(
                elevation: 50,
              child: SizedBox(height: 55, width:double.infinity , child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite),
                  ),
                  Text('Favorilerim', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                ],
              ),), 
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Adreslerim sayfasına gidecek');
              },
              child: Card(
                elevation:50,
              child: SizedBox(height: 55, width: double.infinity, child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.location_pin),
                  ),
                  Text('Adreslerim',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                ],
              ),),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Değerlendirmelerim sayfasına gidecek');
              },
              child:Card(
                elevation:50,
              child: SizedBox(height: 55,width: double.infinity, child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.stars),
                  ),
                  Text('Değerlendirmelerim', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
              ),
          ),
          GestureDetector ( 
            onTap: () {
              print('Müşteri Hizmetleri sayfasına gidecek');
            },
            child: Card(
              elevation: 50,
              child: SizedBox(height:55,width: double.infinity,child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.headphones),
                  ),
                  Text('Müşteri Hizmetleri',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                ],
              ),)
              ),
          ),
            GestureDetector(
              onTap: () {
                print('ayarlarıma gidecek');
              },
              child: Card(
                elevation:50,
                child: SizedBox(height: 55,width: double.infinity, child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings),
                    ),
                    Text('Ayarlarım',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  ],
                ),),
              ),
            ),
          ],
          ),
        ),
      );
  }
}