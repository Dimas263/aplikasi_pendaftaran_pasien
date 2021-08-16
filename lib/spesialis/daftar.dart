import 'package:aplikasi_pendaftaran_pasien/database/firestore.dart';
import 'package:aplikasi_pendaftaran_pasien/main.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/spesialis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:badges/badges.dart';

class AuthPasien extends StatelessWidget {

  final String dokterId;
  final String gambardokterId;
  final String spesialisdokterId;

  AuthPasien({
    required this.dokterId,
    required this.gambardokterId,
    required this.spesialisdokterId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 5.0,
        centerTitle: true,
        title: Text('JENIS PASIEN'),
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"), 
                fit: BoxFit.cover
            )
        ), 
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top:25.0, right: 20.0, left: 20.0,bottom: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    splashColor: HexColor('#ed1c24'),
                    onTap: () {Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: JanjiView(dokterId : dokterId, gambardokterId: gambardokterId, spesialisdokterId: spesialisdokterId)));},
                    child: ListTile(
                      title: Text(
                        'Pasien Baru',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: HexColor('#005194'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Badge(
                        badgeContent: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#ffffff'),),
                        badgeColor: HexColor('#005194'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top:5.0, right: 20.0, left: 20.0,bottom: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    splashColor: HexColor('#ed1c24'),
                    onTap: () {Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: JanjiLama(dokterId : dokterId, gambardokterId: gambardokterId, spesialisdokterId: spesialisdokterId)));},
                    child: ListTile(
                      title: Text(
                        'Pasien Lama',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: HexColor('#005194'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Badge(
                        badgeContent: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#ffffff'),),
                        badgeColor: HexColor('#005194'),
                      ),
                    ),
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

class JanjiLama extends StatelessWidget {

  final String dokterId;
  final String gambardokterId;
  final String spesialisdokterId;

  JanjiLama({
    required this.dokterId,
    required this.gambardokterId,
    required this.spesialisdokterId
  });

  static get user => FirebaseAuth.instance.currentUser;
  static get userid => user.uid;
  final short_userid = userid.substring(userid.length - 6);

  final formKey = GlobalKey<FormState>();

  /* Todo: Data Pasien */
  final no_rekammedis = TextEditingController();
  final tgl_lahir = TextEditingController();

  /* Todo: Data Dokter */
  final jenis_spesialis = TextEditingController();
  final nama_dokter = TextEditingController();
  final janji_temu = TextEditingController();
  final waktu_janji = TextEditingController();
  final format_tanggal = DateFormat("dd-MM-yyyy");
  final format_waktu = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 5.0,
        centerTitle: true,
        title: Text('Buat Janji Dengan Dokter'),
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: Form(
          key: formKey,
          child: Card(
            margin: const EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.white.withOpacity(0.9),
            elevation: 5.0,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /* Todo: Input Data Pasien*/
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Informasi Pasien',
                        style: TextStyle(
                            color: HexColor('#ed1c24'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_rekammedis,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "xxxxxx",
                          labelText: "Nomor Rekam Medis",
                          icon: Text('RM', style: TextStyle(fontWeight: FontWeight.bold),),
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No rekam medis tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: tgl_lahir,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Tanggal Lahir",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    /* Todo: Input Data Spesialis*/
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Informasi Dokter',
                        style: TextStyle(
                            color: HexColor('#ed1c24'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: jenis_spesialis,
                        items: [
                          {
                            'value': spesialisdokterId,
                            'label': spesialisdokterId,
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: spesialisdokterId,
                          labelText: "Spesialis",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Spesialis tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: nama_dokter,
                        items: [
                          {
                            'value': dokterId,
                            'label': dokterId,
                            'icon': ClipOval(child: Image.network(gambardokterId, width: 55, height: 55, fit: BoxFit.cover,),),
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: dokterId,
                          labelText: "Nama Dokter",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Dokter tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: janji_temu,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Tanggal Janji Temu",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                            //initialEntryMode: DatePickerEntryMode.input,
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal janji temu tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: waktu_janji,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Waktu Janji Temu",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_waktu,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            initialEntryMode: TimePickerEntryMode.input,
                          );
                          return DateTimeField.convert(time);
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Waktu janji temu tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0 ,bottom: 25.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0 ,right: 15.0,),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            "Konfirmasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        color: HexColor('#ed1c24'),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: CekJanjiLama(norekammedis: 'RM'+no_rekammedis.text, tgllahir: tgl_lahir.text, namadokter: nama_dokter.text, namaspesialis: jenis_spesialis.text, tanggaljanji: janji_temu.text, waktujanji: waktu_janji.text)));
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 55.0,),
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

class CekJanjiLama extends StatelessWidget {
  final String norekammedis;
  final String tgllahir;
  final String namadokter;
  final String namaspesialis;
  final String tanggaljanji;
  final String waktujanji;

  CekJanjiLama({
    required this.norekammedis,
    required this.tgllahir,
    required this.namadokter,
    required this.namaspesialis,
    required this.tanggaljanji,
    required this.waktujanji,
  });

  static get user => FirebaseAuth.instance.currentUser;
  static get userid => user.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 5.0,
        centerTitle: true,
        title: Text('Buat Janji Dengan Dokter'),
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: Card(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
          color: Colors.white.withOpacity(0.9),
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

                    var noteInfo = snapshot.data!.docs[index].data();
                    // Todo: Informasi Pasien
                    String rekammedis = noteInfo['no_rekammedis'];
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
                    String dokter = namadokter;
                    String spesialis = namaspesialis;
                    String tanggal = tanggaljanji;
                    String waktu = waktujanji;

                    if(norekammedis == rekammedis && tgllahir == lahir){
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Todo: Informasi Pasien
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 5, right: 5,),
                              child: Text(
                                'Informasi Pasien',
                                style: TextStyle(
                                    color: HexColor('#ed1c24'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No. Rekammedis',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Nama',
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
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Marga',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  marga,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Alamat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  alamat,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Kelurahan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  kelurahan,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Kecamatan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  kecamatan,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Kota',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  kota,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Provinsi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  provinsi,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Kode Pos',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  kode_pos,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No.Telp Rumah',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  no_telprumah,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No.HP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  ponsel,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  email,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No. KTP/SIM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  nik,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Tempat Lahir',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  tempat_lahir,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Tanggal Lahir',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  lahir,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Agama',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  agama,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Jenis Kelamin',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  jenis_kelamin,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  status,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Golongan Darah',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  golongan_darah,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Asuransi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  asuransi,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),

                            // Todo: Kontak Darurat
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: Text(
                                'Kontak Darurat',
                                style: TextStyle(
                                    color: HexColor('#ed1c24'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Nama',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  nama_darurat,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Alamat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  alamat_darurat,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No.Telp Rumah',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  no_telprumah_darurat,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'No.HP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  ponsel_darurat,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Hubungan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  hubungan,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Sumber',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  info,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),

                            // Todo: Informasi Dokter
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: Text(
                                'Informasi Dokter',
                                style: TextStyle(
                                    color: HexColor('#ed1c24'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Spesialis',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  spesialis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Dokter',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  dokter,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Tanggal Janji',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  tanggal,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5, right: 5,),
                              child: ListTile(
                                title: Text(
                                  'Waktu Janji',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  waktu,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 5, right: 5,),
                              child: ListTile(
                                title: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      "Kirim",
                                      style: TextStyle(color: HexColor('#ffffff')),
                                    ),
                                    color: HexColor('#ed1c24'),
                                    onPressed: () async {
                                      await Database.addItem(
                                        agama                 : agama,
                                        alamat                : alamat,
                                        alamat_darurat        : alamat_darurat,
                                        asuransi              : asuransi,
                                        dokter                : dokter,
                                        email                 : email,
                                        golongan_darah        : golongan_darah,
                                        hubungan              : hubungan,
                                        info                  : info,
                                        jenis_kelamin         : jenis_kelamin,
                                        kecamatan             : kecamatan,
                                        kelurahan             : kelurahan,
                                        kode_pos              : kode_pos,
                                        kota                  : kota,
                                        lahir                 : lahir,
                                        marga                 : marga,
                                        nama                  : nama,
                                        nama_darurat          : nama_darurat,
                                        nik                   : nik,
                                        no_rekammedis         : rekammedis,
                                        no_telprumah          : no_telprumah,
                                        no_telprumah_darurat  : no_telprumah_darurat,
                                        ponsel                : ponsel,
                                        ponsel_darurat        : ponsel_darurat,
                                        provinsi              : provinsi,
                                        spesialis             : spesialis,
                                        status                : status,
                                        tanggal               : tanggal,
                                        tempat_lahir          : tempat_lahir,
                                        verifikasi            : 'Belum Tersedia',
                                        waktu                 : waktu,
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (context) => new AlertDialog(
                                          title: Text('Janji berhasil dibuat, tunggu beberapa saat kami akan menghubungi anda segera'),
                                          actions: [
                                            TextButton(
                                              child: Text(
                                                'Close',
                                                style: TextStyle(
                                                  color: HexColor('#ed1c24'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: WidgetView(user: user,)));
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 5, right: 5,),
                            ),
                          ],
                        ),
                      );
                    }
                    else{
                      return Container(
                        padding: const EdgeInsets.only(top: 15, left: 5, right: 5,),
                        child: Text(
                          'NOMOR REKAM MEDIS TIDAK DITEMUKAN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return Container();
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

class JanjiView extends StatelessWidget {

  final String dokterId;
  final String gambardokterId;
  final String spesialisdokterId;

  JanjiView({
    required this.dokterId,
    required this.gambardokterId,
    required this.spesialisdokterId
  });

  static get user => FirebaseAuth.instance.currentUser;
  static get userid => user.uid;
  final short_userid = userid.substring(userid.length - 6);

  final formKey = GlobalKey<FormState>();

  /* Todo: Data Pasien */
  final nama_pasien = TextEditingController();
  final nama_marga = TextEditingController();
  final alamat_pasien = TextEditingController();
  final kelurahan = TextEditingController();
  final kecamatan = TextEditingController();
  final kota = TextEditingController();
  final provinsi = TextEditingController();
  final kode_pos = TextEditingController();
  final nik = TextEditingController();
  final email_pasien = TextEditingController();
  final no_telp_rumah = TextEditingController();
  final no_telp = TextEditingController();
  final tempat_lahir = TextEditingController();
  final tgl_lahir = TextEditingController();
  final jenis_kelamin = TextEditingController();
  final agama = TextEditingController();
  final golongan_darah = TextEditingController();
  final status = TextEditingController();
  final jenis_pasien = TextEditingController();

  /* Todo: Kontak Darurat */
  final nama_darurat = TextEditingController();
  final alamat_darurat = TextEditingController();
  final hubungan_darurat = TextEditingController();
  final no_telp_rumah_darurat = TextEditingController();
  final no_telp_darurat = TextEditingController();
  final news = TextEditingController();

  /* Todo: Data Dokter */
  final jenis_spesialis = TextEditingController();
  final nama_dokter = TextEditingController();
  final janji_temu = TextEditingController();
  final waktu_janji = TextEditingController();
  final format_tanggal = DateFormat("dd-MM-yyyy");
  final format_waktu = DateFormat("HH:mm");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 5.0,
        centerTitle: true,
        title: Text('Buat Janji Dengan Dokter'),
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: Form(
          key: formKey,
          child: Card(
            margin: const EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.white.withOpacity(0.9),
            elevation: 5.0,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /* Todo: Input Data Pasien*/
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Informasi Pasien',
                        style: TextStyle(
                            color: HexColor('#ed1c24'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: nama_pasien,
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          hintText: "Dimas Dwi Putra",
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: nama_marga,
                        items: [
                          {
                            'value': 'Jawa',
                            'label': 'Jawa',
                          },
                          {
                            'value': 'Batak',
                            'label': 'Batak',
                          },
                          {
                            'value': 'Betawi',
                            'label': 'Betawi',
                          },
                          {
                            'value': 'Sunda',
                            'label': 'Sunda',
                          },
                          {
                            'value': 'Dayak',
                            'label': 'Dayak',
                          },
                          {
                            'value': 'Asmat',
                            'label': 'Asmat',
                          },
                          {
                            'value': 'Minahasa',
                            'label': 'Minahasa',
                          },
                          {
                            'value': 'Melayu',
                            'label': 'Melayu',
                          },
                          {
                            'value': 'Madura',
                            'label': 'Madura',
                          },
                          {
                            'value': 'Bugis',
                            'label': 'Bugis',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Jawa',
                          labelText: "Nama Marga",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama marga tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: alamat_pasien,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Jl. Raya Pulo Sirih No.24",
                          labelText: "Alamat Lengkap (Sesuai KTP/ID CARD)",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: kelurahan,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Sukajadi",
                          labelText: "Kelurahan",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kelurahan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: kecamatan,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Sukakarya",
                          labelText: "Kecamatan",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kecamatan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: kota,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Bekasi",
                          labelText: "Kota",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kota tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: provinsi,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Jawa Barat",
                          labelText: "Provinsi",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Provinsi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: kode_pos,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "17630",
                          labelText: "Kode Pos",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kode Pos tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: nik,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "32161xxxxxxxxxxx",
                          labelText: "No.KTP/SIM/ID",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No.KTP/SIM/ID tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: email_pasien,
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          hintText: "xxxxxx@gmail.com",
                          labelText: "Alamat Email",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Alamat Email tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_telp_rumah,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "014xxx",
                          labelText: "Nomor Telepon Rumah",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor Telepon Rumah tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_telp,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "08xxxxxxxxxx",
                          labelText: "Nomor HP",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor HP tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: tempat_lahir,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Bekasi",
                          labelText: "Tempat Lahir",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tempat lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: tgl_lahir,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Tanggal Lahir",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: jenis_kelamin,
                        items: [
                          {
                            'value': 'Pria',
                            'label': 'Pria',
                          },
                          {
                            'value': 'Wanita',
                            'label': 'Wanita',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Pria',
                          labelText: "Jenis Kelamin",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jenis kelamin tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: agama,
                        items: [
                          {
                            'value': 'Islam',
                            'label': 'Islam',
                          },
                          {
                            'value': 'Hindu',
                            'label': 'Hindu',
                          },
                          {
                            'value': 'Kristen',
                            'label': 'Kristen',
                          },
                          {
                            'value': 'Budha',
                            'label': 'Budha',
                          },
                          {
                            'value': 'Katolik',
                            'label': 'Katolik',
                          },
                          {
                            'value': 'Kong Hu Cu',
                            'label': 'Kong Hu Cu',
                          },
                          {
                            'value': 'Lainnya',
                            'label': 'Lainnya',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Islam',
                          labelText: "Agama",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Agama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: golongan_darah,
                        items: [
                          {
                            'value': 'A',
                            'label': 'A',
                          },
                          {
                            'value': 'B',
                            'label': 'B',
                          },
                          {
                            'value': 'AB',
                            'label': 'AB',
                          },
                          {
                            'value': 'O',
                            'label': 'O',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'A',
                          labelText: "Golongan Darah",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Golongan darah tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: status,
                        items: [
                          {
                            'value': 'Menikah',
                            'label': 'Menikah',
                          },
                          {
                            'value': 'Belum Menikah',
                            'label': 'Belum Menikah',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Belum Menikah',
                          labelText: "Status",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Status tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: jenis_pasien,
                        items: [
                          {
                            'value': 'Pribadi',
                            'label': 'Pribadi',
                          },
                          {
                            'value': 'BPJS',
                            'label': 'BPJS',
                          },
                          {
                            'value': 'Allianz',
                            'label': 'Allianz',
                          },
                          {
                            'value': 'Prudential',
                            'label': 'Prudential',
                          },
                          {
                            'value': 'Manulife',
                            'label': 'Manulife',
                          },
                          {
                            'value': 'Cigna',
                            'label': 'Cigna',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'BPJS',
                          labelText: "Jenis Pasien",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jenis pasien tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* Todo: Input Kontak Darurat*/
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Kontak Darurat',
                        style: TextStyle(
                            color: HexColor('#ed1c24'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: nama_darurat,
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          hintText: "Masidah",
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: alamat_darurat,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Jl. Raya Pulo Sirih No.24",
                          labelText: "Alamat Lengkap (Sesuai KTP/ID CARD)",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: hubungan_darurat,
                        items: [
                          {
                            'value': 'Suami',
                            'label': 'Suami',
                          },
                          {
                            'value': 'Istri',
                            'label': 'Istri',
                          },
                          {
                            'value': 'Orangtua',
                            'label': 'Orangtua',
                          },
                          {
                            'value': 'Saudara',
                            'label': 'Saudara',
                          },
                          {
                            'value': 'Anak',
                            'label': 'Anak',
                          },
                          {
                            'value': 'Majikan',
                            'label': 'Majikan',
                          },
                          {
                            'value': 'Pengantar',
                            'label': 'Pengantar',
                          },
                          {
                            'value': 'Petugas',
                            'label': 'Petugas',
                          },
                          {
                            'value': 'Lainnya',
                            'label': 'Lainnya',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Orangtua',
                          labelText: "Hubungan",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Hubungan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_telp_rumah_darurat,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "014xxx",
                          labelText: "Nomor Telepon Rumah",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor Telepon Rumah tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_telp_darurat,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "08xxxxxxxxxx",
                          labelText: "Nomor HP",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor HP tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: news,
                        items: [
                          {
                            'value': 'TV',
                            'label': 'TV',
                          },
                          {
                            'value': 'Majalah',
                            'label': 'Majalah',
                          },
                          {
                            'value': 'Internet',
                            'label': 'Internet',
                          },
                          {
                            'value': 'Koran',
                            'label': 'Koran',
                          },
                          {
                            'value': 'Radio',
                            'label': 'Radio',
                          },
                          {
                            'value': 'Spanduk',
                            'label': 'Spanduk',
                          },
                          {
                            'value': 'Seminar',
                            'label': 'Seminar',
                          },
                          {
                            'value': 'Event',
                            'label': 'Event',
                          },
                          {
                            'value': 'SMS/Email',
                            'label': 'SMS/Email',
                          },
                          {
                            'value': 'Referensi Teman',
                            'label': 'Referensi Teman',
                          },
                          {
                            'value': 'Referensi Dokter',
                            'label': 'Referensi Dokter',
                          },
                          {
                            'value': 'Lainnya',
                            'label': 'Lainnya',
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: 'Internet',
                          labelText: "Darimanakah anda mengetahui tentang Omni Hospitals?",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Referensi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* Todo: Input Data Spesialis*/
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Informasi Dokter',
                        style: TextStyle(
                            color: HexColor('#ed1c24'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: jenis_spesialis,
                        items: [
                          {
                            'value': spesialisdokterId,
                            'label': spesialisdokterId,
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: spesialisdokterId,
                          labelText: "Spesialis",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Spesialis tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: nama_dokter,
                        items: [
                          {
                            'value': dokterId,
                            'label': dokterId,
                            'icon': ClipOval(child: Image.network(gambardokterId, width: 55, height: 55, fit: BoxFit.cover,),),
                          },
                        ],
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                        decoration: new InputDecoration(
                          hintText: dokterId,
                          labelText: "Nama Dokter",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Dokter tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: janji_temu,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Tanggal Janji Temu",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                            //initialEntryMode: DatePickerEntryMode.input,
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal janji temu tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: waktu_janji,
                        decoration: new InputDecoration(
                          hintText: "09-04-2021",
                          labelText: "Waktu Janji Temu",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_waktu,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            initialEntryMode: TimePickerEntryMode.input,
                          );
                          return DateTimeField.convert(time);
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Waktu janji temu tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0 ,bottom: 25.0,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0 ,right: 15.0,),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            "Konfirmasi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        color: HexColor('#ed1c24'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
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
                                          title : Text('Nama :'),
                                          subtitle: Text(nama_pasien.text),
                                        ),
                                        ListTile(
                                          title : Text('Marga :'),
                                          subtitle: Text(nama_marga.text),
                                        ),
                                        ListTile(
                                          title : Text('Alamat :'),
                                          subtitle: Text(alamat_pasien.text),
                                        ),
                                        ListTile(
                                          title : Text('Kelurahan :'),
                                          subtitle: Text(kelurahan.text),
                                        ),
                                        ListTile(
                                          title : Text('Kecamatan :'),
                                          subtitle: Text(kecamatan.text),
                                        ),
                                        ListTile(
                                          title : Text('Kota :'),
                                          subtitle: Text(kota.text),
                                        ),
                                        ListTile(
                                          title : Text('Provinsi :'),
                                          subtitle: Text(provinsi.text),
                                        ),
                                        ListTile(
                                          title : Text('Kode Pos :'),
                                          subtitle: Text(kode_pos.text),
                                        ),
                                        ListTile(
                                          title : Text('No.KTP/SIM/ID :'),
                                          subtitle: Text(nik.text),
                                        ),
                                        ListTile(
                                          title : Text('Email :'),
                                          subtitle: Text(email_pasien.text),
                                        ),
                                        ListTile(
                                          title : Text('No.Telp Rumah :'),
                                          subtitle: Text(no_telp_rumah.text),
                                        ),
                                        ListTile(
                                          title : Text('No.Hp :'),
                                          subtitle: Text(no_telp.text),
                                        ),
                                        ListTile(
                                          title : Text('Tempat Lahir :'),
                                          subtitle: Text(tempat_lahir.text),
                                        ),
                                        ListTile(
                                          title : Text('Tanggal Lahir :'),
                                          subtitle: Text(tgl_lahir.text),
                                        ),
                                        ListTile(
                                          title : Text('Jenis Kelamin :'),
                                          subtitle: Text(jenis_kelamin.text),
                                        ),
                                        ListTile(
                                          title : Text('Agama :'),
                                          subtitle: Text(agama.text),
                                        ),
                                        ListTile(
                                          title : Text('Golongan Darah :'),
                                          subtitle: Text(golongan_darah.text),
                                        ),
                                        ListTile(
                                          title : Text('Status :'),
                                          subtitle: Text(status.text),
                                        ),
                                        ListTile(
                                          title : Text('Jenis Pasien :'),
                                          subtitle: Text(jenis_pasien.text),
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
                                          subtitle: Text(nama_darurat.text),
                                        ),
                                        ListTile(
                                          title : Text('Alamat Lengkap :'),
                                          subtitle: Text(alamat_darurat.text),
                                        ),
                                        ListTile(
                                          title : Text('Hubungan :'),
                                          subtitle: Text(hubungan_darurat.text),
                                        ),
                                        ListTile(
                                          title : Text('No.Telp Rumah :'),
                                          subtitle: Text(no_telp_rumah_darurat.text),
                                        ),
                                        ListTile(
                                          title : Text('No.HP :'),
                                          subtitle: Text(no_telp_darurat.text),
                                        ),
                                        ListTile(
                                          title : Text('Sumber :'),
                                          subtitle: Text(news.text),
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
                                          subtitle: Text(jenis_spesialis.text),
                                        ),
                                        ListTile(
                                          title : Text('Nama Dokter :'),
                                          subtitle: Text(nama_dokter.text),
                                        ),
                                        ListTile(
                                          title : Text('Tanggal Temu :'),
                                          subtitle: Text(janji_temu.text),
                                        ),
                                        ListTile(
                                          title : Text('Waktu Temu :'),
                                          subtitle: Text(waktu_janji.text),
                                        ),
                                        ListTile(
                                          title: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Text(
                                              "Kirim",
                                              style: TextStyle(color: HexColor('#ffffff')),
                                            ),
                                            color: HexColor('#ed1c24'),
                                            onPressed: () async {
                                              if (formKey.currentState!.validate()) {

                                                await Database.addItem(
                                                  agama                 : agama.text,
                                                  alamat                : alamat_pasien.text,
                                                  alamat_darurat        : alamat_darurat.text,
                                                  asuransi              : jenis_pasien.text,
                                                  dokter                : nama_dokter.text,
                                                  email                 : email_pasien.text,
                                                  golongan_darah        : golongan_darah.text,
                                                  hubungan              : hubungan_darurat.text,
                                                  info                  : news.text,
                                                  jenis_kelamin         : jenis_kelamin.text,
                                                  kecamatan             : kecamatan.text,
                                                  kelurahan             : kelurahan.text,
                                                  kode_pos              : kode_pos.text,
                                                  kota                  : kota.text,
                                                  lahir                 : tgl_lahir.text,
                                                  marga                 : nama_marga.text,
                                                  nama                  : nama_pasien.text,
                                                  nama_darurat          : nama_darurat.text,
                                                  nik                   : nik.text,
                                                  no_rekammedis         : 'RM' + short_userid,
                                                  no_telprumah          : no_telp_rumah.text,
                                                  no_telprumah_darurat  : no_telp_rumah_darurat.text,
                                                  ponsel                : no_telp.text,
                                                  ponsel_darurat        : no_telp_darurat.text,
                                                  provinsi              : provinsi.text,
                                                  spesialis             : jenis_spesialis.text,
                                                  status                : status.text,
                                                  tanggal               : janji_temu.text,
                                                  tempat_lahir          : tempat_lahir.text,
                                                  verifikasi            : 'Belum Tersedia',
                                                  waktu                 : waktu_janji.text,
                                                );
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => new AlertDialog(
                                                    title: Text('Janji berhasil dibuat, tunggu beberapa saat kami akan menghubungi anda segera'),
                                                    actions: [
                                                      TextButton(
                                                        child: Text(
                                                          'Close',
                                                          style: TextStyle(
                                                            color: HexColor('#ed1c24'),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: WidgetView(user: user,)));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 55.0,),
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

