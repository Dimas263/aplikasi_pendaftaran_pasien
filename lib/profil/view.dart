import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:aplikasi_pendaftaran_pasien/auth/auth.dart';
import 'package:aplikasi_pendaftaran_pasien/auth/sign_in.dart';
import 'package:aplikasi_pendaftaran_pasien/database/firestore.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;
    Database.userUid = _user.uid;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 15, bottom: 15),
              elevation: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                    ),
                    Row(),
                    _user.photoURL != null
                        ? ClipOval(
                      child: Material(
                        color: Colors.grey,
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                        : ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    /*
                    Text(
                      _user.uid,
                      style: TextStyle(
                        color: HexColor('#ed1c24'),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    */
                    Text(
                      _user.displayName!,
                      style: TextStyle(
                        color: HexColor('#ed1c24'),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '(${_user.email!})',
                      style: TextStyle(
                        color: HexColor('#005194'),
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 7.5, right: 7.5, bottom: 15),
                      child: Text(
                        'Kamu masuk melalui akun google, jika ingin keluar dari aplikasi, silahkan klik "Sign Out" dibawah ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    _isSigningOut
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor('#ed1c24'),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



