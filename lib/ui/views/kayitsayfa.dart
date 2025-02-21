import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/renkler.dart';
import 'package:yapilacaklarlistesi/ui/cubit/kayitsayfacubit.dart';

class Kayitsayfa extends StatefulWidget {
  const Kayitsayfa({super.key});

  @override
  State<Kayitsayfa> createState() => _KayitsayfaState();
}

class _KayitsayfaState extends State<Kayitsayfa> {
  var tfKontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Baslikrenk),
        title: Text("KAYIT", style: TextStyle(fontSize: 30)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 335,
              height: 200,
              decoration: BoxDecoration(color: Color(Arkaplanrenk)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Yapilacak görevi buraya yazın",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                controller: tfKontrol,
                minLines: null,
                maxLines: null,
                expands: true,
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
                  context.read<Kayitsayfacubit>().ekleme(tfKontrol.text);
                },
                child: Text("KAYDET", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
