import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/deskripsi.dart';
import 'package:search_page/search_page.dart';

class DataDokter {
  final String gambar, nama, spesialis;
  final page;

  DataDokter(this.gambar, this.nama, this.spesialis, this.page,);
}

class CariView extends StatelessWidget {

  static List<DataDokter> dokter = [
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/f7ee6652cba2aacb102d770f737cf08a.jpg', 'Dr. Florencius Daniel Matondang','Umum', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/685c1a7dc4811ef28366d5b9ddbbfa48.jpg', 'Dr. Mailani Karina Akhmad, Sp.JP, FIHA', 'Spesialis Jantung', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/e261a8480e18d71b261a09acf7e6ca73.jpg', 'Dr. Kabul Priyantoro, Sp.JP(K)', 'Spesialis Jantung', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/e16de101eaa70ccc94c0c4821b5fe61d.jpg', 'Dr. Rudy Kurniawan Putra, Sp.P', 'Spesialis Paru-Paru', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/c30fd7cf966e71041d8d528f41ea7c95.png', 'Dr. Wiro Anton Sumilat', 'Spesialis THT', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/36990f0a9f8629318a73d603ddb9fa40.jpg', 'Dr. Jon Prijadi, Sp.THT-KL', 'Spesialis THT', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/d0bfaecb0b1a0b2f6e3fe971840c481a.png', 'Dr. Dwi Hanny Febrina, Sp.S', 'Spesialis Syaraf', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/164e1c5317deb0a0f990b63d07f536d2.jpg', 'Dr. Gamaliel Wibowo Soetanto, Sp.S, FINA', 'Spesialis Syaraf', DeskripsiDokter(dokterId: 'Dr. Florencius Daniel Matondang')),
    /**
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/db495732bd6784e2349ea78f8491ca3c.jpg', 'Dr. Willibrordus Tantri Winaksa, Sp.M', 'Spesialis Mata', WillibrordusMata()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/45e7f3d4940fab0600bd432dfcc4f397.jpg', 'Dr. Tri Agus Haryono, Sp.M', 'Spesialis Mata', TriMata()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/a5f3d3166f43da3e3d1eefb3ca18e449.jpg', 'Dr. Hadi Firmansyah S., Sp.KK, M.Kes, Sp.KK', 'Spesialis Kulit', HadiKulit()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/6357e0eb3102d64debe0c4d50c2bc5f5.jpg', 'Dr. M. Taufiqur Rahman, Sp.Rad', 'Spesialis Radiologi', TaufiqurRadiologi()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/85f2921dac7160c176b12a6c096c47e6.jpg', 'Dr. Ade Suherlan, Sp.Rad', 'Spesialis Radiologi', AdeRadiologi()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/8f2b629455e35ba145b38ed4bf11d02a.png', 'Dr. Yosephine Yossy, Sp.PD-KEMD', 'Spesialis Penyakit Dalam', YosephinePenyakitDalam()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/34720343fbfb666a62b05161456e6e82.png', 'Dr. Raden Iwantoro, Sp.PD - FINASIM', 'Spesialis Penyakit Dalam', RadenPenyakitDalam()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/ac074534dba51ae9410c4aecbd2939d4.jpg', 'Dr. Fenny Elvina Ridho, Sp.PD', 'Spesialis Penyakit Dalam', FennyPenyakitDalam()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/b15c206cd0129042b832129094c6bd13.jpg', 'Dr. Indra Satiavani, Sp.PD', 'Spesialis Penyakit Dalam', IndraPenyakitDalam()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/bce376ab346ca19612b0407f9866faa1.jpg', 'Dr. Harris Istianggoro, Sp.BS', 'Spesialis Bedah Syaraf', HarrisBedahSyaraf()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/59a37df7b25b73bc215b43c4212edf36.jpg', 'Dr. Nurhasan, Sp.BS', 'Spesialis Bedah Syaraf', HasanBedahSyaraf()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/70de4471a967e4fe60b56a402a54ea7d.jpg', 'Dr. Meky Tanjung, Sp.B', 'Spesialis Bedah Umum', MekyBedahUmum()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/8522677e29b09b24507296a73acb7d38.png', 'Dr. Hendry Susanto, Sp.B', 'Spesialis Bedah Umum', HendryBedahUmum()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/110569219277d1553ecad66a4b0923d0.png', 'Dr. Bayu Hendratmoko, Sp.B', 'Spesialis Bedah Umum', BayuBedahUmum()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/62d9cc2e5b3be448b14ebbbdce8eacde.jpg', 'Dr. Felmond Limanu, Sp.B-KBD', 'Spesialis Bedah Saluran Cerna & Spesialis Digestive Center', FelmondSaluranCerna()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/c2b9021468587cc1b6c6e3c37d180222.jpg', 'Dr. Puri Ambar Lestari, Sp.BP-RE', 'Spesialis Bedah Plastik', PuriPlastik()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/8b582aadf66d992d5324958b6d88c330.png', 'Dr. Laudeo Dhanaba S, Sp.U', 'Spesialis Urologi', LaudeoUrologi()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/dcd91ff814997e416ceb5ec27c06c908.jpg', 'Dr. Dipa Yunta F, Sp.OT', 'Spesialis Orthopaedic', DipaOrthopaedic()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/87c9ccfe053e569bb8c0081c94558478.jpg', 'Dr. Reygais Razman, Sp.OT', 'Spesialis Orthopaedic', ReygaisOrthopaedic()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/c15a5a05de35591dd279f16e14ee96f3.png', 'Dr. Hamonangan, Sp.OG', 'Spesialis Obstetrics dan Gynecology', HamonanganGynecology()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/4231b0494b5b0329843be90fedf53f33.jpg', 'Dr. Heryzal, Sp.OG', 'Spesialis Obstetrics dan Gynecology', HeryzalGynecology()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/eaedff993f357d524295aa26317d9eaf.jpg', 'Dr. Diyah Metta Ningrum, Sp.OG', 'Spesialis Obstetrics dan Gynecology', DiyahGynecology()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/73d7e792a43343cd87021ed6a01d9a2c.jpg', 'Dr. Pudji Windarini, Sp.OG', 'Spesialis Obstetrics dan Gynecology', PudjiGynecology()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/98e0c9296699d011e089130e9da8a407.png', 'Dr. Baginda, Msi, Med, Sp.A', 'Spesialis Anak', BagindaAnak()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/856cc1fd5324ce0fba6912443551eb22.jpg', 'Dr. Candra Segeren, Sp.A, MKes', 'Spesialis Anak', CandraAnak()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/8ef63bd27f02a21470a5002b9ef3c01c.jpg', 'Dr. Darmawan Murdono, Sp.A', 'Spesialis Anak', DarmawanAnak()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/d21a1b9bc338cb659a5d48a7ee2cda60.jpg', 'Dr. Gabriella Tantular, Sp.KJ', 'Spesialis Psychiatrics', GabriellaPsychiatrics()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/4d2af8892779961164cbf0c17d0ea59a.jpg', 'Dr. Rene Rizaldi Pradnasurya, Sp.KFR', 'Spesialis Rehabilitasi Medis', ReneRehabilitasiMedis()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/f503bd88a14d59d2560a23bb9eb003d6.png', 'Drg. Fitrah Makkah, Qualification', 'Spesialis Dental dan Orthodontic', FitrahDental()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/ffe54ff8f9c39a795c0a7a80b584a818.jpg', 'Drg. Nurasi, Qualification', 'Spesialis Dental dan Orthodontic', NurasiDental()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/8a5f1cf868be14362a493db8d0e85728.jpg', 'Drg. Winda Tri Lestari, Qualification', 'Spesialis Dental dan Orthodontic', WindaDental()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/de26ce9b22ac8a75b493276ec1eca484.jpg', 'Drg. Dian Maifara Putri, Sp.BM', 'Spesialis Dental dan Orthodontic', DianDental()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/3aaa786da8207599d36204e21c3c831b.jpg', 'Drg. Mega Kusaladewi, Sp.KG', 'Spesialis Dental dan Orthodontic', MegaDental()),
    DataDokter('https://www.omni-hospitals.com/uploads/images/full/34720343fbfb666a62b05161456e6e82.png', 'Dr. Raden Iwantoro, Sp.PD - FINASIM', 'Spesialis Digestive Center', RadenDigestive()),
    */
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text('DOKTER'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: dokter.length,
          itemBuilder: (context, index) {
            final DataDokter datadokter = dokter[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: datadokter.page));
                },
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
            filter: (datadokter) => [
              datadokter.nama,
              datadokter.spesialis,
            ],
            builder: (datadokter) => Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: datadokter.page));
                },
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
                trailing: FaIcon(FontAwesomeIcons.arrowRight, color: HexColor('#005194'),),
              ),
            ),
          ),
        ),
        child: Icon(Icons.search, color: Colors.white,),
      ),
    );
  }
}
