import 'package:atividade_disciplina_banco_dados_ifce/ui/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.2,
              0.9,
            ],
            colors: [
              Colors.blue,
              Colors.pink,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("images/myMoneyD.png"),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(10.0, 10.0)
                    )
                  ]
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Minha ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 45.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'lilitaOne',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                  Text(
                    " Carteira",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 45.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'lilitaOne',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}