import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/data/repo/yapilacaklardao_repository.dart';

class Kayitsayfacubit extends Cubit<List<Yapilacaklar>> {
  Kayitsayfacubit() : super(<Yapilacaklar>[]);

  var Krepo = YapilacaklardaoRepository();
  Future<void> ekleme( String ad) async {
    await Krepo.ekleme(ad);
  }
}
