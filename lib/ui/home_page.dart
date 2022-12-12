import 'package:atividade_disciplina_banco_dados_ifce/ui/side_menu.dart';
import 'package:flutter/material.dart';
import '../helpers/inflow_helper.dart';
import '../helpers/payments_helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InflowHelper helper = InflowHelper();

  List<Inflow> inflows = [];

  PaymentHelper pHelper = PaymentHelper();

  List<Payment> payments = [];

  @override
  void initState() {
    super.initState();

    _getAllInflows();
    _getAllPayments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem Vindo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _totalInflowCard(context);
                }),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _totalPaymentsCard(context);
                }),
          ),
        ],
      ),
      drawer: const SideMenu(),
    );
  }

  Widget _totalInflowCard(BuildContext context) {
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
                    const Text(
                      "Total em recebimentos :",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: [
                          const Text(
                            "Valor: ",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _totalIncoming().toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
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
        //_showOptions(context, index);
      },
    );
  }

  Widget _totalPaymentsCard(BuildContext context) {
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
                      image: AssetImage('assets/images/dinheirosout.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total em pagamentos :",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: [
                          const Text(
                            "Valor: ",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _totalPayments().toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
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
        //_showOptions(context, index);
      },
    );
  }

  double _totalIncoming() {
    double totalIncoming = 0;
    for (int i = 0; i < inflows.length; i++) {
      totalIncoming += double.parse(inflows[i].preco.toString());
    }
    return totalIncoming;
  }

  double _totalPayments() {
    double totalPayments = 0;
    for (int i = 0; i < payments.length; i++) {
      totalPayments += double.parse(payments[i].preco.toString());
    }
    return totalPayments;
  }

  void _getAllInflows() {
    helper.getAllInflows().then((list) {
      setState(() {
        inflows = list as List<Inflow>;
      });
    });
  }

  void _getAllPayments() {
    pHelper.getAllPayments().then((list) {
      setState(() {
        payments = list as List<Payment>;
      });
    });
  }
}
