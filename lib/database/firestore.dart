import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {

  static String? userUid;

  //Todo : Write Data
  static Future<void> addItem({
    required String nama,
    required String lahir,
    required String ponsel,
    required String spesialis,
    required String dokter,
    required String tanggal,
    required String waktu,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nama" : nama,
      "lahir" : lahir,
      "ponsel" : ponsel,
      "spesialis" : spesialis,
      "dokter" : dokter,
      "tanggal" : tanggal,
      "waktu" : waktu,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Janji temu dengan dokter berhasil dibuat, kami akan menghubungi anda segera"))
        .catchError((e) => print(e));
  }

  //Todo: Read Data
  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
    _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  //Todo: Update Data
  static Future<void> updateItem({
    required String nama,
    required String lahir,
    required String ponsel,
    required String spesialis,
    required String dokter,
    required String tanggal,
    required String waktu,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "nama" : nama,
      "lahir" : lahir,
      "ponsel" : ponsel,
      "spesialis" : spesialis,
      "dokter" : dokter,
      "tanggal" : tanggal,
      "waktu" : waktu,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Janji temu dengan dokter berhasil diupdate"))
        .catchError((e) => print(e));
  }

  //Todo: Delete Data
  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Riwayat janji temu berhasil dihapus'))
        .catchError((e) => print(e));
  }
}