import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/data/entity/renkler.dart';
import 'package:yapilacaklarlistesi/data/entity/yapilacaklar.dart';
import 'package:yapilacaklarlistesi/ui/cubit/anasayfacubit.dart';
import 'package:yapilacaklarlistesi/ui/views/detaysayfa.dart';
import 'package:yapilacaklarlistesi/ui/views/kayitsayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklarListesi();
  }

  bool aramayapiliyormu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: AppBar(
          backgroundColor: Color(Baslikrenk),
          title:
              aramayapiliyormu
                  ? TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (aramakelimesi) {
                      context.read<AnasayfaCubit>().arama(aramakelimesi);
                    },
                  )
                  : Text("YAPILACAKLAR"),
          actions: [
            aramayapiliyormu
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramayapiliyormu = false;
                    });
                    context.read<AnasayfaCubit>().yapilacaklarListesi();
                  },
                  icon: Icon(Icons.clear, size: 30),
                )
                : IconButton(
                  icon: Icon(Icons.search, size: 30),
                  onPressed: () {
                    setState(() {
                      aramayapiliyormu = true;
                    });
                  },
                ),
          ],
          centerTitle: true,
        ),
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yapilacaklar>>(
        builder: (context, yapilacaklarliste) {
          if (yapilacaklarliste.isNotEmpty) {
            return ListView.builder(
              itemCount: yapilacaklarliste.length,
              itemBuilder: (context, index) {
                var yapilacaklar = yapilacaklarliste[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Detaysayfa(yapilacak: yapilacaklar),
                      ),
                    ).then((value) {
                      context.read<AnasayfaCubit>().yapilacaklarListesi();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      color: Color(Arkaplanrenk),
                      child: SizedBox(
                        height: 70,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                yapilacaklar.ad,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(Snackbarrenk),
                                    duration: Duration(seconds: 2),
                                    content: SizedBox(
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${yapilacaklar.ad} Silinsin mi?",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<AnasayfaCubit>()
                                                  .silme(yapilacaklar.id);
                                              ScaffoldMessenger.of(
                                                context,
                                              ).hideCurrentSnackBar();
                                            },
                                            child: Text(
                                              "Evet",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Yapılacaklar Listesi Boş"));
          }
        },
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Color(Buttonrenk),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Kayitsayfa()),
            ).then((value) {
              context.read<AnasayfaCubit>().yapilacaklarListesi();
            });
          },
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
