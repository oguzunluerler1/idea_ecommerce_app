import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idea_ecommerce_app/screens/musteri/my_home_page.dart';
import 'package:idea_ecommerce_app/screens/sign_in.dart';
import 'package:idea_ecommerce_app/widgets/loading_indicator.dart';
import '../services/auth.dart';
import 'package:provider/provider.dart';

class OnBoardWidget extends StatefulWidget {
  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
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
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? MyHomePage() : SignIn();
        } else {
          return LoadingIndicator();
        }
      }
    );
  }
}
