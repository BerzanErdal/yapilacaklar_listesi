import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/data/repo/yapilacaklardao_repository.dart';

class Detaysayfacubit extends Cubit<List<Yapilacaklar>> {
  Detaysayfacubit() : super(<Yapilacaklar>[]);

  var liste = YapilacaklardaoRepository();

  Future<void> guncelle(int id, String ad) async {
   await liste.guncelle(id, ad);
  }
}
