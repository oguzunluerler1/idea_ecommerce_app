import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
//*Auth servisindeki fonksiyonu provider vasıtası ile çağırıp firebase authentication'ı yapıyoruz.
                    /* Provider.of<Auth>(context, listen: false)
                        .signInAnonymously(); */

                   /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage())); */
                  },
                  child: Text('Sign in Anonymously')),

//*paket kullanarak istediğim buttonları tanımladım çok da pratik oldu.
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Email,
                onPressed: () {/* 
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmailAuth(),
                  )); */
                },
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
