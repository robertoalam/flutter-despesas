import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String , double , DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  DateTime _dataSelecionadaController = DateTime.now() ;

  _submitForm(){
    final title = _tituloController.text;
    final valor = double.tryParse(_valorController.text)?? 0.00 ;
    if(title.isEmpty || valor <= 0){
      return;
    }
    widget.onSubmit(title , valor , _dataSelecionadaController);
  }

  _showDatePicker(){
    showDatePicker(
      context: context ,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then( (pickedDate){
      if( pickedDate == null){
        return;
      }

      setState(() {
        _dataSelecionadaController = pickedDate;
      });

    });
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
              controller: _tituloController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                  labelText: "Titulo"
              ),
            ),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                  labelText: "Valor R\$"
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child:Text(
                      _dataSelecionadaController == null
                          ? "Nenhuma data selecionada !"
                          : "Data Selecionada ${DateFormat('dd/MM/y').format(_dataSelecionadaController)}"
                    ),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                      child: Text("Selecioar Data" , style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: (){
                    _submitForm();
                  },
                  child: Text('Nova Transacao'),
                  color: Theme.of(context).primaryColor ,
                  textColor: Theme.of(context).textTheme.button.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
