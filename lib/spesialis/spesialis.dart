import 'package:aplikasi_pendaftaran_pasien/database/spesialis.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/dokter.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class SpesialisView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Cikarang.read_nama_spesialis(),
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
                  String jumlah = noteInfo['jumlah'];

                  if (nama == 'Lihat Semua Dokter') {
                    return Container(
                      child: Card(
                        margin: const EdgeInsets.only(top: 5, left: 10, right: 10,bottom: 5),
                        color: HexColor('#ffffff'),
                        elevation: 5.0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ListTile(
                            minVerticalPadding: 22,
                            onTap: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: AllDokterList()));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Image.network(gambar),
                            ),
                            title: Text(nama),
                            trailing:  Badge(
                              badgeContent: Text(
                                jumlah,
                                style: TextStyle(
                                  color: HexColor('#ffffff'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeColor: HexColor('#ed1c24'),
                              //child:  FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  else if (nama != 'Lihat Semua Dokter'){
                    return Container(
                      child: Card(
                        margin: const EdgeInsets.only(top: 5, left: 10, right: 10,bottom: 5),
                        color: HexColor('#ffffff'),
                        elevation: 5.0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ListTile(
                            minVerticalPadding: 22,
                            onTap: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: DokterList(dokterId:nama)));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Image.network(gambar),
                            ),
                            title: Text(nama),
                            trailing:  Badge(
                              badgeContent: Text(
                                jumlah,
                                style: TextStyle(
                                  color: HexColor('#ffffff'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeColor: HexColor('#ed1c24'),
                              //child:  FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                            ),
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
