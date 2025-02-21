import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/data/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit() : super(<Yapilacaklar>[]);

  var yRepo = YapilacaklardaoRepository();

  Future<void> yapilacaklarListesi() async {
    var liste = await yRepo.yapilacaklarListesi();
    emit(liste);
  }

  Future<void> silme(int id) async {
    await yRepo.silme(id);
    await yapilacaklarListesi();
  }

  Future<void> arama(String aramakelimesi) async {
    var liste=await yRepo.arama(aramakelimesi);
    emit(liste);
  }
}
