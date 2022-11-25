import 'package:atividade_disciplina_banco_dados_ifce/ui/add_inflow_screen.dart';
import 'package:flutter/material.dart';
import 'package:atividade_disciplina_banco_dados_ifce/helpers/inflow_helper.dart';

class InflowScreen extends StatefulWidget {
  const InflowScreen({Key? key}) : super(key: key);

  @override
  State<InflowScreen> createState() => _InflowScreenState();
}

class _InflowScreenState extends State<InflowScreen> {
  InflowHelper helper = InflowHelper();

  List<Inflow> inflows = [];

  @override
  void initState() {
    super.initState();

    _getAllInflows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recebimentos'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInflowPage();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: inflows.length,
          itemBuilder: (context, index) {
            return _inflowCard(context, index);
          }),
    );
  }

  Widget _inflowCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/dinheiros.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      inflows[index].origem ?? "",
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Valor: ",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inflows[index].preco ?? "",
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Parcela:  ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            inflows[index].parcela ?? "",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Data: ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            inflows[index].dataRecebimento ?? "",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showInflowPage(inflow: inflows[index]);
                        },
                        child: const Text(
                          "Editar",
                          style: TextStyle(color: Colors.blue, fontSize: 20.0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          helper.deleteInflow(inflows[index].id!);
                          setState(() {
                            inflows.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          "Deletar",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void _showInflowPage({Inflow? inflow}) async {
    final recInflow = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddInflowScreen(
                  inflow: inflow,
                )));
    if (recInflow != null) {
      if (inflow != null) {
        await helper.updateInflow(recInflow);
      } else {
        await helper.saveInflow(recInflow);
      }
      _getAllInflows();
    }
  }

  void _getAllInflows() {
    helper.getAllInflows().then((list) {
      setState(() {
        inflows = list as List<Inflow>;
      });
    });
  }
}
