import 'package:atividade_disciplina_banco_dados_ifce/helpers/payments_helpers.dart';
import 'package:flutter/material.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({Key? key, this.payment}) : super(key: key);

  final Payment? payment;

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {

  final _precoController = TextEditingController();
  final _parcelaController = TextEditingController();
  final _credorController = TextEditingController();
  final _dataPagamentoController = TextEditingController();

  final _precoFocus = FocusNode();
  final _parcelaFocus = FocusNode();
  final _credorFocus = FocusNode();
  final _dataPagamentoFocus = FocusNode();

  bool _userEdited = false;

  Payment? _editedPayment;


  @override
  void initState() {
    super.initState();

    if (widget.payment == null) {
      _editedPayment = Payment();
    } else {
      _editedPayment = Payment.fromMap(widget.payment!.toMap());

      _precoController.text = _editedPayment!.preco!;
      _parcelaController.text = _editedPayment!.parcela!;
      _credorController.text = _editedPayment!.credor!;
      _dataPagamentoController.text = _editedPayment!.dataPagamento!;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_editedPayment?.preco ?? "Novo Pagamento"),
        centerTitle: true,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_editedPayment?.preco != null && _editedPayment?.parcela != null &&
              _editedPayment?.credor != null && _editedPayment?.dataPagamento != null){
            Navigator.pop(context, _editedPayment);
          }else if(_editedPayment?.preco == null){
            FocusScope.of(context).requestFocus(_precoFocus);
          }else if(_editedPayment?.parcela == null){
            FocusScope.of(context).requestFocus(_parcelaFocus);
          }else if(_editedPayment?.credor == null){
            FocusScope.of(context).requestFocus(_credorFocus);
          }else{
            FocusScope.of(context).requestFocus(_dataPagamentoFocus);
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save),
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/dinheiros.png"),),
                ),
              ),
            ),
            TextField(
              controller: _precoController,
              focusNode: _precoFocus,
              decoration: const InputDecoration(labelText: "Preço"),
              onChanged: (text){
                _userEdited = true;
                _editedPayment?.preco = text;
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _parcelaController,
              focusNode: _parcelaFocus,
              decoration: const InputDecoration(labelText: "Parcela"),
              onChanged: (text){
                _userEdited = true;
                _editedPayment?.parcela = text;
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _credorController,
              focusNode: _credorFocus,
              decoration: const InputDecoration(labelText: "Credor"),
              onChanged: (text){
                _userEdited = true;
                _editedPayment?.credor = text;
              },
            ),
            TextField(
              controller: _dataPagamentoController,
              focusNode: _dataPagamentoFocus,
              decoration: const InputDecoration(labelText: "Data do Pagamento"),
              onChanged: (text){
                _userEdited = true;
                _editedPayment?.dataPagamento = text;
              },
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),

    );
  }
}
