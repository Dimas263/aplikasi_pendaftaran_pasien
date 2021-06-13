import 'package:aplikasi_pendaftaran_pasien/auth/sign_in.dart';
import 'package:aplikasi_pendaftaran_pasien/home/home.dart';
import 'package:aplikasi_pendaftaran_pasien/pencarian.dart';
import 'package:aplikasi_pendaftaran_pasien/profil/view.dart';
import 'package:aplikasi_pendaftaran_pasien/riwayat/view.dart';
import 'package:aplikasi_pendaftaran_pasien/spesialis/spesialis.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor('#ed1c24'),
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: HexColor('#ed1c24'),
        accentColor: HexColor('#ed1c24'),
        colorScheme: ColorScheme.light(primary: HexColor('#ed1c24')),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      home: SplashScreenView(
        navigateRoute: LoginView(),
        duration: 6000,
        imageSize: 150,
        imageSrc: "images/logo/logo.png",
        text: "RUMAH SAKIT",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 40.0,
          color: HexColor('#ffffff')
        ),
        backgroundColor: HexColor('#ed1c24'),
      ),
    );
  }
}

const _url_whatsapp = 'http://wa.me/+622129779999?text=Hi';
void _launchURL_whatsapp() async =>
    await canLaunch(_url_whatsapp) ? await launch(_url_whatsapp) : throw 'Could not launch $_url_whatsapp';

const _url_website = 'https://www.omni-hospitals.com/';
void _launchURL_website() async =>
    await canLaunch(_url_website) ? await launch(_url_website) : throw 'Could not launch $_url_website';

const _url_instagram = 'https://www.instagram.com/omnihospitalsgroup';
void _launchURL_instagram() async =>
    await canLaunch(_url_instagram) ? await launch(_url_instagram) : throw 'Could not launch $_url_instagram';

const _url_youtube = 'https://www.youtube.com/channel/UCcRwBCmdKLh0ljZ-g6i3LlA';
void _launchURL_youtube() async =>
    await canLaunch(_url_youtube) ? await launch(_url_youtube) : throw 'Could not launch $_url_youtube';

const _url_lokasi_rumah_sakit = 'https://goo.gl/maps/QYF9HjRdZHWsu5yr9';
void _launchURL_lokasi_rumah_sakit() async =>
    await canLaunch(_url_lokasi_rumah_sakit) ? await launch(_url_lokasi_rumah_sakit) : throw 'Could not launch $_url_lokasi_rumah_sakit';

const _url_ambulan = 'tel:1500108';
void _launchURL_ambulan() async =>
    await canLaunch(_url_ambulan) ? await launch(_url_ambulan) : throw 'Could not launch $_url_ambulan';


class WidgetView extends StatefulWidget {
  const WidgetView({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _WidgetViewState createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {
  int selectedIndex = 0;
  final pageOption = [
    HomeView(user: user),
    SpesialisView(),
    RiwayatView(user: user),
    AboutView(user: user),
  ];

  static get user => FirebaseAuth.instance.currentUser;

  Future<dynamic> exitDialog(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: ListTile(
          title: Text('Peringatan', style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: FaIcon(
            FontAwesomeIcons.exclamationCircle,
            color: HexColor('#ed1c24'),
          ),
        ),
        content: Text('Apakah anda yakin ingin Keluar Dari Aplikasi?'),
        actions: [
          TextButton(
            child: Text(
              'Keluar',
              style: TextStyle(
                color: HexColor('#ed1c24'),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: Text(
              'Batal',
              style: TextStyle(
                color: HexColor('#ed1c24'),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 5.0,
        centerTitle: true,
        title: Text('OMNI HOSPITALS'),
        brightness: Brightness.dark,
        backgroundColor: HexColor('#ed1c24'),
        actions: [
          /*
          Padding(
            padding: EdgeInsets.all(10.0),
            //child: Icon(Icons.notifications),
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '01-06-2021',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#ed1c24'),
                              ),
                            ),
                            Text(
                              ' (pukul 12.30) ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#000000'),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Tidak Ada Janji Dengan Dokter',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#ed1c24'),
                          ),
                        ),
                        Text(
                          'Spesialis Bedah Umum',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#005194'),
                          ),
                        ),
                        Text(
                          'Dr.Meky Tanjung, Sp.B',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#000000'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              icon: Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(
                    color: HexColor('#ffffff'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                badgeColor: HexColor('#005194'),
                child: Icon(Icons.notifications),
              ),
              offset: Offset(0, 40),
            ),
          ),
          */
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              color: HexColor('#ed1c24'),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: CariView()));
                },
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 5.0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/file/omnicikarang.png'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset('images/logo/omnihospital.png'),
              ),
              accountEmail: Text('omni-hospitals.com'),
              accountName: Text('Omni Hospitals'),
            ),
            ListTile(
              onTap: _launchURL_ambulan,
              title: Text('Panggil Ambulan'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/ambulan.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchURL_website,
              title: Text('Website'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/website.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchURL_whatsapp,
              title: Text('Whatsapp'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/whatsapp.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchURL_instagram,
              title: Text('Instagram'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/instagram.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchURL_youtube,
              title: Text('Youtube'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/youtube.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchURL_lokasi_rumah_sakit,
              title: Text('Lokasi Rumah Sakit'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/maps.png'),
              ),
            ),
            Divider(),
            ListTile(
              onTap:  () => exitDialog(),
              title: Text('Keluar'),
              leading: CircleAvatar(
                backgroundColor: HexColor('#fbfbf2'),
                child: Image.asset('images/icon/exit.png'),
              ),
            ),
          ],
        ),
      ),
      body: pageOption[selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: HexColor('#ffffff'),
          selectedItemBorderColor: HexColor('#000000'),
          selectedItemBackgroundColor: HexColor('#000000'),
          selectedItemIconColor: HexColor('#ffffff'),
          selectedItemLabelColor: HexColor('#000000'),
          showSelectedItemShadow: false,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.stethoscope,
            label: 'Spesialis',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.notesMedical,
            label: 'Riwayat',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.userAlt,
            label: 'Saya',
          ),
        ],
      ),
    );
  }
}