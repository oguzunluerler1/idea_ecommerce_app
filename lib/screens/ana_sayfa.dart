import 'package:flutter/material.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Ürün veya Satıcı ismi girerek arayınız."),
              ),
              /* GridView.extent(
                shrinkWrap: true,
                childAspectRatio: 1,
                maxCrossAxisExtent: 50,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.amber,
                  )
                ],
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
