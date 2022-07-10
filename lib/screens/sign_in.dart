import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//*Klavye ekranı yukarı ittiriyordu. Onun için koydum.
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/signintop.png'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.purple,
                        ),
                        hintText: 'Emailinizi giriniz',
                        hintStyle: TextStyle(color: Colors.purple.shade200),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.purple.shade200)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.purple,
                          ),
                          hintStyle: TextStyle(color: Colors.purple.shade200),
                          hintText: 'Şifrenizi giriniz.',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade200)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200, width: 4))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Şifremi unuttum.',
                          style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.4, 40)),
                      onPressed: () {},
                      child: Text(
                        'Giriş',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 25),
                    //*paket kullanarak istediğim buttonları tanımladım çok da pratik oldu.
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: SignInButton(
                        shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.purple.shade200)),
                        Buttons.Google,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text('Yeni Kullanıcı? Hesap Oluştur'))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/signinbottom.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
