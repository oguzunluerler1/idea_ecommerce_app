import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idea_ecommerce_app/screens/musteri/my_home_page.dart';
import '../screens/musteri/favoriler_provider.dart';
import '../services/auth.dart';
import 'package:provider/provider.dart';

class OnBoardWidget extends StatefulWidget {
  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {

  @override
  void initState() {
    super.initState();
    //TODO: SPLASH 
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavorilerProvider>().getFavorites();
    });
  }


  @override
  Widget build(BuildContext context) { 
    //*Telefon ekranının yan dönmesini engelleyen kod.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final _auth = Provider.of<Auth>(context, listen: false);

    return StreamBuilder<User?>(
      stream: _auth.authStatus(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return MyHomePage();
        //todo buglu bi bakın
        // if (snapshot.connectionState == ConnectionState.active) {
        //   return snapshot.data != null ? MyHomePage() : SignIn();
        // } else { 
        //   return LoadingIndicator();
        // }
      }
    );
  }
}
