import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/spesialis.dart';

class PulomasView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text('OMNI PULOMAS'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnipulomas.png"),
                fit: BoxFit.cover)
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 25, right: 10, left: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: HexColor('#ed1c24'),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  splashColor: HexColor('#005194'),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: SpesialisView()));
                  },
                  child: ListTile(
                    title: Text(
                      "Dokter & Spesialis",
                      style: TextStyle(color: HexColor('#ffffff')),
                      textAlign: TextAlign.center,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CikarangView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text('OMNI CIKARANG'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 25, right: 10, left: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: HexColor('#ed1c24'),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  splashColor: HexColor('#005194'),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: SpesialisView()));
                  },
                  child: ListTile(
                    title: Text(
                      "Dokter & Spesialis",
                      style: TextStyle(color: HexColor('#ffffff')),
                      textAlign: TextAlign.center,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PekayonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text('OMNI PEKAYON'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnipekayon.png"),
                fit: BoxFit.cover)
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 25, right: 10, left: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: HexColor('#ed1c24'),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  splashColor: HexColor('#005194'),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: SpesialisView()));
                  },
                  child: ListTile(
                    title: Text(
                      "Dokter & Spesialis",
                      style: TextStyle(color: HexColor('#ffffff')),
                      textAlign: TextAlign.center,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlamSutera extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text('OMNI ALAM SUTERA'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnialamsutera.jpg"),
                fit: BoxFit.cover)
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 25, right: 10, left: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(top: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: HexColor('#ed1c24'),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  splashColor: HexColor('#005194'),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: SpesialisView()));
                  },
                  child: ListTile(
                    title: Text(
                      "Dokter & Spesialis",
                      style: TextStyle(color: HexColor('#ffffff')),
                      textAlign: TextAlign.center,
                    ),
                    trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



