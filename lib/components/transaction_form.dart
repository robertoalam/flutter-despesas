import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String , double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  TextEditingController tituloController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  _submitForm(){
    final title = tituloController.text;
    final valor = double.tryParse(valorController.text)?? 0.00 ;
    if(title.isEmpty || valor <= 0){
      return;
    }
    widget.onSubmit(title , valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                  labelText: "Titulo"
              ),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                  labelText: "Valor R\$"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: (){
                    _submitForm();
                  },
                  textColor: Colors.purple,
                  child: Text('Nova Transacao'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
