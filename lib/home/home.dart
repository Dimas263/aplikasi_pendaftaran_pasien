import 'package:aplikasi_pendaftaran_pasien/database/spesialis.dart';
import 'package:aplikasi_pendaftaran_pasien/home/hospital.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/dokter.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/spesialis.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late User _user;

  static get user => FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/file/omnicikarang.png"),
                fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,bottom: 15),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 1/1,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    'https://www.omni-hospitals.com/uploads/images/full/f7ee6652cba2aacb102d770f737cf08a.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/685c1a7dc4811ef28366d5b9ddbbfa48.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/e261a8480e18d71b261a09acf7e6ca73.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/e16de101eaa70ccc94c0c4821b5fe61d.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/c30fd7cf966e71041d8d528f41ea7c95.png',
                    'https://www.omni-hospitals.com/uploads/images/full/36990f0a9f8629318a73d603ddb9fa40.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/d0bfaecb0b1a0b2f6e3fe971840c481a.png',
                    'https://www.omni-hospitals.com/uploads/images/full/164e1c5317deb0a0f990b63d07f536d2.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/db495732bd6784e2349ea78f8491ca3c.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/45e7f3d4940fab0600bd432dfcc4f397.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/a5f3d3166f43da3e3d1eefb3ca18e449.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/6357e0eb3102d64debe0c4d50c2bc5f5.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/85f2921dac7160c176b12a6c096c47e6.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/8f2b629455e35ba145b38ed4bf11d02a.png',
                    'https://www.omni-hospitals.com/uploads/images/full/34720343fbfb666a62b05161456e6e82.png',
                    'https://www.omni-hospitals.com/uploads/images/full/ac074534dba51ae9410c4aecbd2939d4.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/b15c206cd0129042b832129094c6bd13.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/bce376ab346ca19612b0407f9866faa1.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/59a37df7b25b73bc215b43c4212edf36.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/70de4471a967e4fe60b56a402a54ea7d.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/8522677e29b09b24507296a73acb7d38.png',
                    'https://www.omni-hospitals.com/uploads/images/full/110569219277d1553ecad66a4b0923d0.png',
                    'https://www.omni-hospitals.com/uploads/images/full/62d9cc2e5b3be448b14ebbbdce8eacde.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/c2b9021468587cc1b6c6e3c37d180222.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/8b582aadf66d992d5324958b6d88c330.png',
                    'https://www.omni-hospitals.com/uploads/images/full/dcd91ff814997e416ceb5ec27c06c908.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/87c9ccfe053e569bb8c0081c94558478.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/c15a5a05de35591dd279f16e14ee96f3.png',
                    'https://www.omni-hospitals.com/uploads/images/full/4231b0494b5b0329843be90fedf53f33.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/eaedff993f357d524295aa26317d9eaf.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/73d7e792a43343cd87021ed6a01d9a2c.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/98e0c9296699d011e089130e9da8a407.png',
                    'https://www.omni-hospitals.com/uploads/images/full/856cc1fd5324ce0fba6912443551eb22.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/8ef63bd27f02a21470a5002b9ef3c01c.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/d21a1b9bc338cb659a5d48a7ee2cda60.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/4d2af8892779961164cbf0c17d0ea59a.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/f503bd88a14d59d2560a23bb9eb003d6.png',
                    'https://www.omni-hospitals.com/uploads/images/full/ffe54ff8f9c39a795c0a7a80b584a818.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/8a5f1cf868be14362a493db8d0e85728.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/de26ce9b22ac8a75b493276ec1eca484.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/3aaa786da8207599d36204e21c3c831b.jpg',
                    'https://www.omni-hospitals.com/uploads/images/full/34720343fbfb666a62b05161456e6e82.png',
                    'https://www.omni-hospitals.com/uploads/images/full/62d9cc2e5b3be448b14ebbbdce8eacde.jpg',].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Image.network(
                            '$i',
                            //width: 300,
                            //height: 200,
                            //fit:BoxFit.fill
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: HexColor('#ffffff'),
                  elevation: 5.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    splashColor: HexColor('#ed1c24'),
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: SpesialisView()));
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(
                          'Buat Janji Dengan Dokter',
                          style: TextStyle(
                              color: HexColor('#005194'),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: HexColor('#005194'),
                          child: FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: HexColor('#ffffff'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: HexColor('#ffffff'),
                      elevation: 5.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: HexColor('#ed1c24'),
                        onTap: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: PulomasView()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#ffffff'),
                                radius: 25,
                                child: Image.asset('images/logo/omnihospital.png'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Pulomas',
                                    style: TextStyle(
                                        color: HexColor('#005194'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: HexColor('#ffffff'),
                      elevation: 5.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: HexColor('#ed1c24'),
                        onTap: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: PekayonView()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#ffffff'),
                                radius: 25,
                                child: Image.asset('images/logo/omnihospital.png'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Pekayon',
                                    style: TextStyle(
                                        color: HexColor('#005194'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: HexColor('#ffffff'),
                      elevation: 5.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: HexColor('#ed1c24'),
                        onTap: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: CikarangView()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#ffffff'),
                                radius: 25,
                                child: Image.asset('images/logo/omnihospital.png'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Cikarang',
                                    style: TextStyle(
                                        color: HexColor('#005194'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: HexColor('#ffffff'),
                      elevation: 5.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: HexColor('#ed1c24'),
                        onTap: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: AlamSutera()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#ffffff'),
                                radius: 25,
                                child: Image.asset('images/logo/omnihospital.png'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Alam Sutera',
                                    style: TextStyle(
                                        color: HexColor('#005194'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  color: HexColor('#ffffff'),
                  elevation: 5.0,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,),
                          child: Text(
                            'Spesialis',
                            style: TextStyle(
                                color: HexColor('#005194'),
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,bottom: 15),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: DatabaseCikarang.read_nama_spesialis_limit(),
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
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  separatorBuilder: (context, index) => SizedBox(height: 0.0),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var noteInfo = snapshot.data!.docs[index].data();
                                    String nama = noteInfo['nama'];
                                    String gambar = noteInfo['gambar'];
                                    String jumlah = noteInfo['jumlah'];

                                    return Card(
                                      elevation: 3,
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: DokterList(dokterId: nama)));
                                        },
                                        leading: ClipOval(
                                          child: Image.network(gambar, height: 50, width: 50, fit: BoxFit.contain,),
                                        ),
                                        title: Text(nama),
                                        trailing: Badge(
                                          badgeContent: Text(
                                            jumlah,
                                            style: TextStyle(
                                              color: HexColor('#ffffff'),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          badgeColor: HexColor('#ed1c24'),
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
                        Container(
                          margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,bottom: 15),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: SpesialisView()));
                            },
                            title: Text(
                              'Lihat Selengkapnya',
                              style: TextStyle(
                                  color: HexColor('#005194'),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top:15,right: 10.0,left: 10.0,bottom: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

