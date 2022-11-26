import 'package:atividade_disciplina_banco_dados_ifce/helpers/payments_helpers.dart';
import 'package:flutter/material.dart';

import 'add_payment_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  PaymentHelper helper = PaymentHelper();

  List<Payment> payments = [];

  @override
  void initState() {
    super.initState();

    _getAllPayments();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPaymentPage();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: payments.length,
          itemBuilder: (context, index) {
            return _paymentCard(context, index);
          }),
    );
  }

  Widget _paymentCard(BuildContext context, int index) {
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
                    Text(
                      payments[index].credor ?? "",
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
                            payments[index].preco ?? "",
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
                            payments[index].parcela ?? "",
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
                            payments[index].dataPagamento ?? "",
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
                          _showPaymentPage(payment: payments[index]);
                        },
                        child: const Text(
                          "Editar",
                          style: TextStyle(color: Colors.blue, fontSize: 20.0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          helper.deletePayment(payments[index].id!);
                          setState(() {
                            payments.removeAt(index);
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

  void _showPaymentPage({Payment? payment}) async {
    final recPayment = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddPaymentScreen(
                  payment: payment,
                )));
    if (recPayment != null) {
      if (payment != null) {
        await helper.updatePayment(recPayment);
      } else {
        await helper.savePayment(recPayment);
      }
      _getAllPayments();
    }
  }

  void _getAllPayments() {
    helper.getAllPayments().then((list) {
      setState(() {
        payments = list as List<Payment>;
      });
    });
  }
}
