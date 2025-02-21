import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String VeritabaniAdi = "yapilacaklar.sqlite";

  static Future<Database> veritabanierisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), VeritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabani zaten kopyalandı kopyalamaya gerek yok");
    } else {
      ByteData data = await rootBundle.load("veritabani/$VeritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabani kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}
