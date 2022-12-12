import 'package:atividade_disciplina_banco_dados_ifce/ui/spl_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade de Banco De Dados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white60,
      ),
      home: SplashScreen(),
    );
  }
}
