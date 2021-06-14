import 'package:aplikasi_pendaftaran_pasien/database/spesialis.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/deskripsi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class DokterList extends StatelessWidget {
  final String dokterId;
  DokterList({
    required this.dokterId
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Cikarang.read_spesialis(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Error',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HexColor('#ed1c24'),
            ),
          );
        }
        else if (snapshot.hasData || snapshot.data != null) {
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              elevation: 5.0,
              centerTitle: true,
              title: Text('Data Dokter'),
              backgroundColor: HexColor('#ed1c24'),
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/file/omnicikarang.png"),
                      fit: BoxFit.cover)
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var noteInfo = snapshot.data!.docs[index].data();
                  String nama = noteInfo['nama'];
                  String gambar = noteInfo['gambar'];
                  String spesialis = noteInfo['spesialis'];
                  if (spesialis == dokterId) {
                    return Container(
                      margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 10, bottom: 5),
                      child: Card(
                        color: HexColor('#ffffff'),
                        elevation: 5.0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ListTile(
                            minVerticalPadding: 22,
                            onTap: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: DeskripsiDokter(dokterId:nama, gambardokterId: gambar, spesialisdokterId: spesialis,)));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Image.network(gambar),
                            ),
                            title: Text(nama),
                            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              HexColor('#ed1c24'),
            ),
          ),
        );
      },
    );
  }
}

class AllDokterList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Cikarang.read_spesialis(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Error',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HexColor('#ed1c24'),
            ),
          );
        }
        else if (snapshot.hasData || snapshot.data != null) {
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              elevation: 5.0,
              centerTitle: true,
              title: Text('Data Dokter'),
              backgroundColor: HexColor('#ed1c24'),
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/file/omnicikarang.png"),
                      fit: BoxFit.cover)
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var noteInfo = snapshot.data!.docs[index].data();
                  String nama = noteInfo['nama'];
                  String gambar = noteInfo['gambar'];
                  String spesialis = noteInfo['spesialis'];
                  return Container(
                    margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 10, bottom: 5),
                    child: Card(
                      color: HexColor('#ffffff'),
                      elevation: 5.0,
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ListTile(
                          minVerticalPadding: 22,
                          onTap: () {
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: DeskripsiDokter(dokterId:nama, gambardokterId: gambar, spesialisdokterId: spesialis,)));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Image.network(gambar),
                          ),
                          title: Text(nama),
                          trailing: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              HexColor('#ed1c24'),
            ),
          ),
        );
      },
    );
  }
}