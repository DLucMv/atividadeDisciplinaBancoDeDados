import 'package:atividade_disciplina_banco_dados_ifce/ui/home_page.dart';
import 'package:atividade_disciplina_banco_dados_ifce/ui/inflow_screen.dart';
import 'package:atividade_disciplina_banco_dados_ifce/ui/payment_screen.dart';
import 'package:atividade_disciplina_banco_dados_ifce/ui/team_page.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/dinheiros.png'))),
            child: Text(
              'App Sem Nome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_rounded),
            title: const Text('Início'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return HomePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Recebimentos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return InflowScreen();
                    },
                  ),
                );
              },
          ),
          ListTile(
            leading: const Icon(Icons.remove_circle_rounded),
            title: const Text('Pagamentos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return PaymentsScreen();
                  },
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Meu perfil'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Encerrar sessão'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return TeamPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}