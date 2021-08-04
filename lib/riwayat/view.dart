import 'package:aplikasi_pendaftaran_pasien/database/firestore.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/spesialis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  @override
  _RiwayatViewState createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    Database.userUid = _user.uid;
    super.initState();
  }


  late String dokterId;
  late String gambardokterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, duration: Duration(seconds: 1), child: SpesialisView()));
        },
        backgroundColor: HexColor('#ed1c24'),
        child: Icon(
          Icons.add,
          color: HexColor('#ffffff'),
          size: 32,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: Card(
          margin: const EdgeInsets.only(left: 25,right: 25, top: 25, bottom: 25),
          elevation: 5,
          color: Colors.white.withOpacity(0.8),
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.readItems(),
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
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 0.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //Todo: ID Antrian
                    var id = snapshot.data!.docs[index].id;
                    String documentid = id;

                    var no_antrian = documentid.substring(documentid.length - 6);

                    var noteInfo = snapshot.data!.docs[index].data();
                    String nama = noteInfo['nama'];
                    String lahir = noteInfo['lahir'];
                    String ponsel = noteInfo['ponsel'];
                    String asuransi = noteInfo['asuransi'];
                    String spesialis = noteInfo['spesialis'];
                    String dokter = noteInfo['dokter'];
                    String tanggal = noteInfo['tanggal'];
                    String waktu = noteInfo['waktu'];

                    return Container(
                      margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 10, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Text(
                              'No Antrian',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#ed1c24'),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            title: Text(
                              ': ' + no_antrian,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#ed1c24'),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          ListTile(
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tanggal,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#005194'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  waktu,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nama,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  lahir,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  ponsel,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "Pasien " + asuransi,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'Spesialis'+' '+spesialis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  dokter,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Divider(color: HexColor('#005194'),),
                        ],
                      ),
                    );
                  },
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
          ),
        ),
      ),
    );
  }
}
