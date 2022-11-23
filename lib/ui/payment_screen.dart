import 'package:atividade_disciplina_banco_dados_ifce/helpers/payments_helpers.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {

  PaymentHelper helper = PaymentHelper();

  List<Payment> payments = [];


  @override
  void initState(){
    super.initState();

    /*Payment p = Payment();
    p.preco = "1000";
    p.parcela = "1";
    p.dataPagamento = "23/10/2022";
    p.credor = "Mercadinho";

    helper.savePayment(p);

    helper.getAllPayments().then((list) => print(list));*/


  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
