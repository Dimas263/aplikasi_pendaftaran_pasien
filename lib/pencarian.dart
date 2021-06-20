
import 'package:aplikasi_pendaftaran_pasien/database/spesialis.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/daftar.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/deskripsi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search_page/search_page.dart';

class DataDokter {
  final String gambar, nama, spesialis;
  final page;

  DataDokter(this.gambar, this.nama, this.spesialis, this.page,);
}

class CariView extends StatelessWidget {
  List<DataDokter> dokter = [
    DataDokter('', '', '', JanjiView(dokterId: '', gambardokterId: '', spesialisdokterId: '',))
  ];

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
              elevation: 5.0,
              centerTitle: true,
              title: Text('DOKTER'),
              brightness: Brightness.dark,
              backgroundColor: HexColor('#ed1c24'),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/file/omnicikarang.png"),
                      fit: BoxFit.cover)
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 0.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var noteInfo = snapshot.data!.docs[index].data();

                  String nama = noteInfo['nama'];
                  String gambar = noteInfo['gambar'];
                  String spesialis = noteInfo['spesialis'];

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: DeskripsiDokter(dokterId: nama, gambardokterId: gambar, spesialisdokterId: spesialis,)));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.network(gambar),
                      ),
                      title: Text(nama),
                      subtitle: Text(
                        spesialis,
                        style: TextStyle(
                          color: HexColor('#005194'),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: HexColor('#005194'),
              tooltip: 'Cari Dokter',
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<DataDokter>(
                  onQueryUpdate: (s) => print(s),
                  items: dokter,
                  searchLabel: 'Cari Dokter / Spesialis',
                  suggestion: Center(
                    child: Text('Cari Dokter Berdasarkan Nama Atau Spesialis'),
                  ),
                  failure: Center(
                    child: Text('Dokter Tidak Ditemukan :('),
                  ),
                  filter: (datadokter) =>
                  [
                    datadokter.nama,
                    datadokter.spesialis,
                  ],
                  builder: (datadokter) =>
                      Card(
                        child: ListTile(
                          onTap: () => datadokter.page,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.network(datadokter.gambar),
                          ),
                          title: Text(datadokter.nama),
                          subtitle: Text(
                            datadokter.spesialis,
                            style: TextStyle(
                              color: HexColor('#005194'),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
                        ),
                      ),
                ),
              ),
              child: Icon(Icons.search, color: Colors.white,),
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