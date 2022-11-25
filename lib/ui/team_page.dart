import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
              child: Text(
                "Este aplicativo foi desenvolvido como "
                    "trabalho de conclusão da disciplina de Banco De Dados "
                    "do curso de Engenharia da Computação - IFCE",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 22.0,),
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Text(
                "Desenvolvido por (ordem alfabética): ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0,),
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Ana Pinheiro", style: TextStyle(fontSize: 18.0,),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Alan Andrade", style: TextStyle(fontSize: 18.0,),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Davison Lucas", style: TextStyle(fontSize: 18.0,),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Text("Leone", style: TextStyle(fontSize: 18.0,),),
            ),
          ],
        ),
      ),
    );
  }
}
