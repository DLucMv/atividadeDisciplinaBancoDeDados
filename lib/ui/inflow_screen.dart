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

    helper.getAllInflows().then((list) {
      setState(() {
        inflows = list as List<Inflow>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recebimentos'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: inflows.length,
          itemBuilder: (context, index) {
            return _inflowCard(context, index);
          }),
    );
  }

  Widget _inflowCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/dinheiros.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      inflows[index].preco ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      inflows[index].parcela ?? "",
                      style: TextStyle(
                          fontSize: 18.0,),
                    ),
                    Text(
                      inflows[index].dataRecebimento ?? "",
                      style: TextStyle(
                          fontSize: 18.0,),
                    ),
                    Text(inflows[index].origem ?? "",
                      style: TextStyle(fontSize: 22.0,
                          fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
