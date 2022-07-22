import 'package:flutter/material.dart';
import 'package:idea_ecommerce_app/app_constants/app_strings.dart';
import 'package:idea_ecommerce_app/screens/musteri/productsInCategoryView.dart';
import 'package:idea_ecommerce_app/utilities/route_helper.dart';
import 'package:idea_ecommerce_app/widgets/page_appbar_title.dart';

class KategorilerView extends StatefulWidget {
  const KategorilerView({Key? key}) : super(key: key);


  @override
  State<KategorilerView> createState() => _KategorilerViewState();
}

class _KategorilerViewState extends State<KategorilerView> {

  List<String> urlList = [
    "https://www.pngmart.com/files/3/Music-PNG-Photos.png",
    "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c543.png",
    "https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png",
    "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4cf.png",
    "https://assets.stickpng.com/images/580b585b2edbce24c47b2cf2.png",
    "https://assets.stickpng.com/images/580b57fcd9996e24bc43c548.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: PageAppBarTitle(text: kategorilerAppTitle),
      ),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              RouteHelper.goRoute(context: context, page: ProductsInCat(title: "Kategori $index",));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.primaries[index % Colors.primaries.length].shade200,
                      child: image(index)
                    )
                  ),
                ),
                SizedBox(height: 8,),
                Text("Kategori $index")
              ],
            ),
          );
        },
      ),
    );
  }

  Image image(int index) => Image.network("${urlList[index]}", fit: BoxFit.contain);
}