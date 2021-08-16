import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {

  static String? userUid;

  //Todo : Write Data
  static Future<void> addItem({
    required String agama,
    required String alamat,
    required String alamat_darurat,
    required String asuransi,
    required String dokter,
    required String email,
    required String golongan_darah,
    required String hubungan,
    required String info,
    required String jenis_kelamin,
    required String kecamatan,
    required String kelurahan,
    required String kode_pos,
    required String kota,
    required String lahir,
    required String marga,
    required String nama,
    required String nama_darurat,
    required String nik,
    required String no_rekammedis,
    required String no_telprumah,
    required String no_telprumah_darurat,
    required String ponsel,
    required String ponsel_darurat,
    required String provinsi,
    required String spesialis,
    required String status,
    required String tanggal,
    required String tempat_lahir,
    required String verifikasi,
    required String waktu,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "agama"                 : agama,
      "alamat"                : alamat,
      "alamat_darurat"        : alamat_darurat,
      "asuransi"              : asuransi,
      "dokter"                : dokter,
      "email"                 : email,
      "golongan_darah"        : golongan_darah,
      "hubungan"              : hubungan,
      "info"                  : info,
      "jenis_kelamin"         : jenis_kelamin,
      "kecamatan"             : kecamatan,
      "kelurahan"             : kelurahan,
      "kode_pos"              : kode_pos,
      "kota"                  : kota,
      "lahir"                 : lahir,
      "marga"                 : marga,
      "nama"                  : nama,
      "nama_darurat"          : nama_darurat,
      "nik"                   : nik,
      "no_rekammedis"         : no_rekammedis,
      "no_telprumah"          : no_telprumah,
      "no_telprumah_darurat"  : no_telprumah_darurat,
      "ponsel"                : ponsel,
      "ponsel_darurat"        : ponsel_darurat,
      "provinsi"              : provinsi,
      "spesialis"             : spesialis,
      "status"                : status,
      "tanggal"               : tanggal,
      "tempat_lahir"          : tempat_lahir,
      "verifikasi"            : verifikasi,
      "waktu"                 : waktu,
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
    required String agama,
    required String alamat,
    required String alamat_darurat,
    required String asuransi,
    required String dokter,
    required String email,
    required String golongan_darah,
    required String hubungan,
    required String info,
    required String jenis_kelamin,
    required String kecamatan,
    required String kelurahan,
    required String kode_pos,
    required String kota,
    required String lahir,
    required String marga,
    required String nama,
    required String nama_darurat,
    required String nik,
    required String no_rekammedis,
    required String no_telprumah,
    required String no_telprumah_darurat,
    required String ponsel,
    required String ponsel_darurat,
    required String provinsi,
    required String spesialis,
    required String status,
    required String tanggal,
    required String tempat_lahir,
    required String verifikasi,
    required String waktu,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "agama"                 : agama,
      "alamat"                : alamat,
      "alamat_darurat"        : alamat_darurat,
      "asuransi"              : asuransi,
      "dokter"                : dokter,
      "email"                 : email,
      "golongan_darah"        : golongan_darah,
      "hubungan"              : hubungan,
      "info"                  : info,
      "jenis_kelamin"         : jenis_kelamin,
      "kecamatan"             : kecamatan,
      "kelurahan"             : kelurahan,
      "kode_pos"              : kode_pos,
      "kota"                  : kota,
      "lahir"                 : lahir,
      "marga"                 : marga,
      "nama"                  : nama,
      "nama_darurat"          : nama_darurat,
      "nik"                   : nik,
      "no_rekammedis"         : no_rekammedis,
      "no_telprumah"          : no_telprumah,
      "no_telprumah_darurat"  : no_telprumah_darurat,
      "ponsel"                : ponsel,
      "ponsel_darurat"        : ponsel_darurat,
      "provinsi"              : provinsi,
      "spesialis"             : spesialis,
      "status"                : status,
      "tanggal"               : tanggal,
      "tempat_lahir"          : tempat_lahir,
      "verifikasi"            : verifikasi,
      "waktu"                 : waktu,
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