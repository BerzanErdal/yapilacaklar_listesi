import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/renkler.dart';
import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/ui/cubit/detaysayfacubit.dart';

class Detaysayfa extends StatefulWidget {
  Yapilacaklar yapilacak;
  Detaysayfa({required this.yapilacak});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  var tfKontrol = TextEditingController();

  @override
  void initState() {
    tfKontrol.text = widget.yapilacak.ad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Baslikrenk),
        title: Text("DETAY", style: TextStyle(fontSize: 30)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 335,
              decoration: BoxDecoration(color: Color(Arkaplanrenk)),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                controller: tfKontrol,
                maxLines: 5,
                minLines: 1,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Buttonrenk),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Detaysayfacubit>().guncelle(
                    widget.yapilacak.id,
                    tfKontrol.text,
                  );
                },
                child: Text("GÜNCELLE", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
