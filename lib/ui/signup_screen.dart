import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Nome Completo"),
              validator: (text){
                if(text == null) return "Digite um nome!";
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Endereço"),
              validator: (text){
                if(text == null) return "Digite um endereço!";
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text == null || !text.contains("@")) return "E-mail inválido!";
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Senha"),
              obscureText: true,
              validator: (text){
                if(text == null || text.length < 6) return "Senha inválida!";
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 5,
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){

                }
              },
              child: const Text('Criar Conta', style: TextStyle(fontSize: 22),),

            ),
          ],
        ),
      ),
    );
  }
}
