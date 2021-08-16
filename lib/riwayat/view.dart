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
                    String rekammedis = noteInfo['no_rekammedis'];
                    String verifikasi = noteInfo['verifikasi'];

                    // Todo: Informasi Pasien
                    String nama = noteInfo['nama'];
                    String marga = noteInfo['marga'];
                    String alamat = noteInfo['alamat'];
                    String kelurahan = noteInfo['kelurahan'];
                    String kecamatan = noteInfo['kecamatan'];
                    String kota = noteInfo['kota'];
                    String provinsi = noteInfo['provinsi'];
                    String kode_pos = noteInfo['kode_pos'];
                    String no_telprumah = noteInfo['no_telprumah'];
                    String ponsel = noteInfo['ponsel'];
                    String email = noteInfo['email'];
                    String nik = noteInfo['nik'];
                    String tempat_lahir = noteInfo['tempat_lahir'];
                    String lahir = noteInfo['lahir'];
                    String agama = noteInfo['agama'];
                    String jenis_kelamin = noteInfo['jenis_kelamin'];
                    String status = noteInfo['status'];
                    String golongan_darah = noteInfo['golongan_darah'];
                    String asuransi = noteInfo['asuransi'];

                    // Todo: Kontak Darurat
                    String nama_darurat = noteInfo['nama_darurat'];
                    String alamat_darurat = noteInfo['alamat_darurat'];
                    String no_telprumah_darurat = noteInfo['no_telprumah_darurat'];
                    String ponsel_darurat = noteInfo['ponsel_darurat'];
                    String hubungan = noteInfo['hubungan'];
                    String info = noteInfo['info'];

                    // Todo: Informasi Dokter
                    String dokter = noteInfo['dokter'];
                    String spesialis = noteInfo['spesialis'];
                    String tanggal = noteInfo['tanggal'];
                    String waktu = noteInfo['waktu'];

                    return Container(
                      margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 10, bottom: 5),
                      child: Card(
                        margin: const EdgeInsets.only(left: 7.5,right: 7.5, top: 5, bottom: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(0.0),
                          splashColor: HexColor('#ed1c24'),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        /* Todo: Informasi Pasien */
                                        ListTile(
                                          title: Text(
                                            'Informasi Pasien',
                                            style: TextStyle(
                                                color: HexColor('#ed1c24'),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ListTile(
                                          title : Text('No.Rekammedis :'),
                                          subtitle: Text(rekammedis),
                                        ),
                                        ListTile(
                                          title : Text('Status :'),
                                          subtitle: Text(verifikasi),
                                        ),
                                        ListTile(
                                          title : Text('No.Antrian :'),
                                          subtitle: Text(no_antrian),
                                        ),
                                        ListTile(
                                          title : Text('Nama :'),
                                          subtitle: Text(nama),
                                        ),
                                        ListTile(
                                          title : Text('Marga :'),
                                          subtitle: Text(marga),
                                        ),
                                        ListTile(
                                          title : Text('Alamat :'),
                                          subtitle: Text(alamat),
                                        ),
                                        ListTile(
                                          title : Text('Kelurahan :'),
                                          subtitle: Text(kelurahan),
                                        ),
                                        ListTile(
                                          title : Text('Kecamatan :'),
                                          subtitle: Text(kecamatan),
                                        ),
                                        ListTile(
                                          title : Text('Kota :'),
                                          subtitle: Text(kota),
                                        ),
                                        ListTile(
                                          title : Text('Provinsi :'),
                                          subtitle: Text(provinsi),
                                        ),
                                        ListTile(
                                          title : Text('Kode Pos :'),
                                          subtitle: Text(kode_pos),
                                        ),
                                        ListTile(
                                          title : Text('No.KTP/SIM/ID :'),
                                          subtitle: Text(nik),
                                        ),
                                        ListTile(
                                          title : Text('Email :'),
                                          subtitle: Text(email),
                                        ),
                                        ListTile(
                                          title : Text('No.Telp Rumah :'),
                                          subtitle: Text(no_telprumah),
                                        ),
                                        ListTile(
                                          title : Text('No.Hp :'),
                                          subtitle: Text(ponsel),
                                        ),
                                        ListTile(
                                          title : Text('Tempat Lahir :'),
                                          subtitle: Text(tempat_lahir),
                                        ),
                                        ListTile(
                                          title : Text('Tanggal Lahir :'),
                                          subtitle: Text(lahir),
                                        ),
                                        ListTile(
                                          title : Text('Jenis Kelamin :'),
                                          subtitle: Text(jenis_kelamin),
                                        ),
                                        ListTile(
                                          title : Text('Agama :'),
                                          subtitle: Text(agama),
                                        ),
                                        ListTile(
                                          title : Text('Golongan Darah :'),
                                          subtitle: Text(golongan_darah),
                                        ),
                                        ListTile(
                                          title : Text('Status Pasien :'),
                                          subtitle: Text(status),
                                        ),
                                        ListTile(
                                          title : Text('Jenis Pasien :'),
                                          subtitle: Text(asuransi),
                                        ),

                                        /* Todo: Kontak Darurat */
                                        ListTile(
                                          title: Text(
                                            'Kontak Darurat',
                                            style: TextStyle(
                                                color: HexColor('#ed1c24'),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ListTile(
                                          title : Text('Nama Lengkap :'),
                                          subtitle: Text(nama_darurat),
                                        ),
                                        ListTile(
                                          title : Text('Alamat Lengkap :'),
                                          subtitle: Text(alamat_darurat),
                                        ),
                                        ListTile(
                                          title : Text('Hubungan :'),
                                          subtitle: Text(hubungan),
                                        ),
                                        ListTile(
                                          title : Text('No.Telp Rumah :'),
                                          subtitle: Text(no_telprumah_darurat),
                                        ),
                                        ListTile(
                                          title : Text('No.HP :'),
                                          subtitle: Text(ponsel_darurat),
                                        ),
                                        ListTile(
                                          title : Text('Sumber Informasi :'),
                                          subtitle: Text(info),
                                        ),

                                        /* Todo: Informasi Dokter */
                                        ListTile(
                                          title: Text(
                                            'Informasi Dokter',
                                            style: TextStyle(
                                                color: HexColor('#ed1c24'),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ListTile(
                                          title : Text('Spesialis :'),
                                          subtitle: Text(spesialis),
                                        ),
                                        ListTile(
                                          title : Text('Nama Dokter :'),
                                          subtitle: Text(dokter),
                                        ),
                                        ListTile(
                                          title : Text('Tanggal Temu :'),
                                          subtitle: Text(tanggal),
                                        ),
                                        ListTile(
                                          title : Text('Waktu Temu :'),
                                          subtitle: Text(waktu),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:15.0, right: 5.0, left: 5.0),
                                child: ListTile(
                                  title: Text(
                                    'Nomor Rekammedis',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#ed1c24'),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  subtitle: Text(
                                    rekammedis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                                child: ListTile(
                                  title: Text(
                                    'Status :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  subtitle: Text(
                                    verifikasi,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                                child: ListTile(
                                  title: Text(
                                    'No Antrian :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  subtitle: Text(
                                    no_antrian,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                                child: ListTile(
                                  title: Text(
                                    'Nama :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  subtitle: Text(
                                    nama,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                                child: ListTile(
                                  title: Text(
                                    'Lihat Detail Janji',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#005194'),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
