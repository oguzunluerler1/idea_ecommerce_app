import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class kayitliKartView extends StatefulWidget {
  const kayitliKartView({Key? key}) : super(key: key);

  @override
  State<kayitliKartView> createState() => _kayitliKartViewState();
}

class _kayitliKartViewState extends State<kayitliKartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıtlı Kartlarım", style: TextStyle(color: Colors.purple),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){print("profil ekranına git");}, icon: Icon(Icons.person, color: Colors.purple,))
        ],
      ),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Kayıtlı Kartlarım (3)", style: TextStyle(color: Colors.red, fontSize: 30),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                kart1(),
                kart2(),
                kart3(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget kart2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: kartIciYazilar2(),
              ),
              height: 140,
              width: 200,
            ),
    );
  }

  Widget kart3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: kartIciYazilar3(),
              ),
              height: 140,
              width: 200,
            ),
    );
  }

  Widget kart1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: kartIciYazilar1(),
                ),
                height: 140,
                width: 200,
              ),
    );
  }

  Column kartIciYazilar1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/kartlogolar/akbank.png",fit: BoxFit.contain,),
          height: 20,
          width: 70,
        ),
        Row(
          children: [
            Container(
              child: Image.asset("assets/kartlogolar/axess.jpg", fit: BoxFit.contain,),
              height: 30,
              ),
            Spacer(),  
            Container(
              child: Image.asset("assets/kartlogolar/chip.jpg", fit: BoxFit.contain,),
              height: 30,
              ),  
          ],
        ),
        Text("4355 08** **** 2075"),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text("Ali Ali"),
              Spacer(),
              Container(height: 15,child: Image.asset("assets/kartlogolar/visa.jpg"))
            ],
          ),
        )

        
      ],
    );
  }

    Column kartIciYazilar2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/kartlogolar/iş.png",fit: BoxFit.contain,),
          height: 20,
          width: 70,
        ),
        Row(
          children: [
            Container(
              child: Image.asset("assets/kartlogolar/maximum.png", fit: BoxFit.contain,),
              height: 30,
              width: 100,
              ),
            Spacer(),  
            Container(
              child: Image.asset("assets/kartlogolar/chip.jpg", fit: BoxFit.contain,),
              height: 30,
              ),  
          ],
        ),
        Text("5891 82 **** 4371"),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text("Veli Veli"),
              Spacer(),
              Container(height: 15,child: Image.asset("assets/kartlogolar/mastercard.png"))
            ],
          ),
        )

        
      ],
    );
  }


    Column kartIciYazilar3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Image.asset("assets/kartlogolar/ziraat.png",fit: BoxFit.contain,),
          height: 20,
          width: 70,
        ),
        Row(
          children: [
            Container(
              child: Image.asset("assets/kartlogolar/bankkart.png", fit: BoxFit.contain,),
              height: 30,
              width: 100,
              ),
            Spacer(),  
            Container(
              child: Image.asset("assets/kartlogolar/chip.jpg", fit: BoxFit.contain,),
              height: 30,
              ),  
          ],
        ),
        Text("9999 88** **** 2222"),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text("Asdf asdf"),
              Spacer(),
              Container(height: 15,child: Image.asset("assets/kartlogolar/mastercard.png"))
            ],
          ),
        )

        
      ],
    );
  }



}