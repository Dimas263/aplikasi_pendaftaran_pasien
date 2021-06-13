
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('spesialis');

class Cikarang {

  static String? omnicikarang = 'cikarang';
  static String? omnipekayon = 'pekayon';
  static String? omnialamsutera = 'alam_sutera';
  static String? omnipulomas = 'pulomas';

  //Todo: Read Nama Spesialis
  static Stream<QuerySnapshot> read_nama_spesialis() {
    Query notesItemCollection =
    _mainCollection.doc(omnicikarang).collection('nama_spesialis').orderBy('nama');

    return notesItemCollection.snapshots();
  }

  //Todo: Read Nama Spesialis
  static Stream<QuerySnapshot> read_nama_spesialis_limit() {
    Query notesItemCollection =
    _mainCollection.doc(omnicikarang).collection('nama_spesialis').orderBy('nama', descending: true).limit(8);

    return notesItemCollection.snapshots();
  }

  //Todo: Read Data Dokter
  static Stream<QuerySnapshot> read_spesialis() {
    Query notesItemCollection =
    _mainCollection.doc(omnicikarang).collection('spesialis').orderBy('nama');

    return notesItemCollection.snapshots();
  }

}