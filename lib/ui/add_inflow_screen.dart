import 'package:atividade_disciplina_banco_dados_ifce/helpers/inflow_helper.dart';
import 'package:flutter/material.dart';

class AddInflowScreen extends StatefulWidget {
  const AddInflowScreen({Key? key, this.inflow}) : super(key: key);

  final Inflow? inflow;

  @override
  State<AddInflowScreen> createState() => _AddInflowScreenState();
}

class _AddInflowScreenState extends State<AddInflowScreen> {

  final _precoController = TextEditingController();
  final _parcelaController = TextEditingController();
  final _origemController = TextEditingController();
  final _dataRecebimentoController = TextEditingController();

  final _precoFocus = FocusNode();
  final _parcelaFocus = FocusNode();
  final _origemFocus = FocusNode();
  final _dataRecebimentoFocus = FocusNode();

  bool _userEdited = false;

  Inflow? _editedInflow;

  @override
  void initState() {
    super.initState();

    if (widget.inflow == null) {
      _editedInflow = Inflow();
    } else {
      _editedInflow = Inflow.fromMap(widget.inflow!.toMap());

      _precoController.text = _editedInflow!.preco!;
      _parcelaController.text = _editedInflow!.parcela!;
      _origemController.text = _editedInflow!.origem!;
      _dataRecebimentoController.text = _editedInflow!.dataRecebimento!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_editedInflow?.preco ?? "Novo Recebimento"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_editedInflow?.preco != null && _editedInflow?.parcela != null &&
          _editedInflow?.origem != null && _editedInflow?.dataRecebimento != null){
            Navigator.pop(context, _editedInflow);
          }else if(_editedInflow?.preco == null){
            FocusScope.of(context).requestFocus(_precoFocus);
          }else if(_editedInflow?.parcela == null){
            FocusScope.of(context).requestFocus(_parcelaFocus);
          }else if(_editedInflow?.origem == null){
            FocusScope.of(context).requestFocus(_origemFocus);
          }else{
            FocusScope.of(context).requestFocus(_dataRecebimentoFocus);
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
                _editedInflow?.preco = text;
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _parcelaController,
              focusNode: _parcelaFocus,
              decoration: const InputDecoration(labelText: "Parcela"),
              onChanged: (text){
                _userEdited = true;
                _editedInflow?.parcela = text;
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _origemController,
              focusNode: _origemFocus,
              decoration: const InputDecoration(labelText: "Origem"),
              onChanged: (text){
                _userEdited = true;
                _editedInflow?.origem = text;
              },
            ),
            TextField(
              controller: _dataRecebimentoController,
              focusNode: _dataRecebimentoFocus,
              decoration: const InputDecoration(labelText: "Data de Recebimento"),
              onChanged: (text){
                _userEdited = true;
                _editedInflow?.dataRecebimento = text;
              },
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),
    );
  }
}
