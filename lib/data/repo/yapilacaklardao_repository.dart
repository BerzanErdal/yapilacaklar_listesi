import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/data/sqlite/veritabani_yardimcisi.dart';

class YapilacaklardaoRepository {
  Future<List<Yapilacaklar>> yapilacaklarListesi() async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM yapilacaklar",
    );

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(id: satir["id"], ad: satir["ad"]);
    });
  }

  Future<void> guncelle(int id, String ad) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    var guncelyapilacak = Map<String, dynamic>();
    guncelyapilacak['ad'] = ad;
    await db.update(
      "yapilacaklar",
      guncelyapilacak,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> ekleme(String ad) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    var eklemeyapilacak = Map<String, dynamic>();
    eklemeyapilacak['ad'] = ad;
    await db.insert("yapilacaklar", eklemeyapilacak);
  }

  Future<void> silme(int id) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    await db.delete("yapilacaklar", where: "id= ?", whereArgs: [id]);
  }

  Future<List<Yapilacaklar>> arama(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM yapilacaklar where ad like '%$aramaKelimesi%'",
    );

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(id: satir["id"], ad: satir["ad"]);
    });
  }
}
