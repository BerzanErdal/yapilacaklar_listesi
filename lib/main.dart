import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklarlistesi/ui/cubit/anasayfacubit.dart';
import 'package:yapilacaklarlistesi/ui/cubit/detaysayfacubit.dart';
import 'package:yapilacaklarlistesi/ui/cubit/kayitsayfacubit.dart';
import 'package:yapilacaklarlistesi/ui/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => Detaysayfacubit()),
        BlocProvider(create: (context) => Kayitsayfacubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
