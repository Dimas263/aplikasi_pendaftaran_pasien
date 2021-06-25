import 'package:aplikasi_pendaftaran_pasien/database/firestore.dart';
import 'package:aplikasi_pendaftaran_pasien/main.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:select_form_field/select_form_field.dart';

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

  final formKey = GlobalKey<FormState>();
  final nama_pasien = TextEditingController();
  final tgl_lahir = TextEditingController();
  final no_telp = TextEditingController();
  final jenis_pasien = TextEditingController();
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
            color: Colors.white.withOpacity(0.8),
            elevation: 5.0,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 25.0,bottom: 5.0),
                      child: TextFormField(
                        controller: no_telp,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "085811379583",
                          labelText: "Nomor Ponsel",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor Ponsel tidak boleh kosong';
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
                            return 'Jenis Pasien tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
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
                        type: SelectFormFieldType.dialog,
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
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Konfirmasi",
                        style: TextStyle(color: HexColor('#ffffff')),
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
                                content: Column(
                                  children: [
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
                                      leading : Text('Nama                 :'),
                                      title: Text(nama_pasien.text),
                                    ),
                                    ListTile(
                                      leading : Text('Tanggal Lahir   :'),
                                      title: Text(tgl_lahir.text),
                                    ),
                                    ListTile(
                                      leading : Text('No.Telepon       :'),
                                      title: Text(no_telp.text),
                                    ),
                                    ListTile(
                                      leading : Text('Jenis Pasien       :'),
                                      title: Text(jenis_pasien.text),
                                    ),
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
                                      leading : Text('Spesialis           :'),
                                      title: Text(jenis_spesialis.text),
                                    ),
                                    ListTile(
                                      leading : Text('Nama Dokter    :'),
                                      title: Text(nama_dokter.text),
                                    ),
                                    ListTile(
                                      leading : Text('Janji Temu        :'),
                                      title: Text(janji_temu.text),
                                    ),
                                    ListTile(
                                      leading : Text('Waktu Temu      :'),
                                      title: Text(waktu_janji.text),
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
                                              nama: nama_pasien.text,
                                              lahir: tgl_lahir.text,
                                              ponsel: no_telp.text,
                                              asuransi: jenis_pasien.text,
                                              spesialis: jenis_spesialis.text,
                                              dokter: nama_dokter.text,
                                              tanggal: janji_temu.text,
                                              waktu: waktu_janji.text,
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
                              );
                            },
                          );
                        }
                      },
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

