import 'package:atividade_disciplina_banco_dados_ifce/models/user_model.dart';
import 'package:atividade_disciplina_banco_dados_ifce/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return  Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused)) {
                          return Colors.blue;
                        }
                        return null;
                      }),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.12);
                        }
                        return null;
                      },),
                    ),
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
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
                  child: const Text('Entrar', style: TextStyle(fontSize: 22),),

                ),
              ],
            ),
          );
        },
      ),
    );
  }


}
