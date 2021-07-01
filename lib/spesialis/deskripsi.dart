import 'package:aplikasi_pendaftaran_pasien/database/spesialis.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/daftar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';


get user => FirebaseAuth.instance.currentUser;

class DeskripsiDokter extends StatelessWidget {

  final String dokterId;
  final String gambardokterId;
  final String spesialisdokterId;

  DeskripsiDokter({
    required this.dokterId,
    required this.gambardokterId,
    required this.spesialisdokterId
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
                separatorBuilder: (context, index) => SizedBox(height: 0.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var noteInfo = snapshot.data!.docs[index].data();
                  String nama = noteInfo['nama'];
                  String gambar = noteInfo['gambar'];
                  String spesialis = noteInfo['spesialis'];
                  String senin = noteInfo['senin'];
                  String selasa = noteInfo['selasa'];
                  String rabu = noteInfo['rabu'];
                  String kamis = noteInfo['kamis'];
                  String jumat = noteInfo['jumat'];
                  String sabtu = noteInfo['sabtu'];
                  String minggu = noteInfo['minggu'];
                  if (nama == dokterId && gambar == gambardokterId && spesialis == spesialisdokterId) {
                    return Container(
                      margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 10, bottom: 5),
                      child: Card(
                        margin: const EdgeInsets.only(top: 15, left: 10, right: 10,),
                        color: HexColor('#ffffff'),
                        elevation: 5.0,
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                                  child: ClipOval(
                                    child: Image.network(
                                      gambar,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 2.5),
                                  child: Text(
                                    nama,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2.5, right: 25, left: 25, bottom: 5),
                                  child: Text(
                                    spesialis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#ed1c24'),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 2.5),
                                  child: Text(
                                    'Jadwal Jaga',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2.5, right: 25, left: 25, bottom: 5),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          'Senin',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          senin,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Selasa',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          selasa,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Rabu',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          rabu,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Kamis',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          kamis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Jumat',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          jumat,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Sabtu',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          sabtu,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Minggu',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text(
                                          ':',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        trailing: Text(
                                          minggu,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 15),
                                  child: Card(
                                    color: HexColor('#ed1c24'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: JanjiView(dokterId : dokterId, gambardokterId: gambardokterId, spesialisdokterId: spesialisdokterId)));
                                      },
                                      title: Text(
                                        'Buat Janji Dengan Dokter',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white,),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 5),
                                ),
                              ],
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