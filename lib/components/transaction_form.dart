import 'package:flutter/material.dart';

import 'botao_adaptavel.dart';
import 'datepicker_adaptavel.dart';
import 'textfield_adaptavel.dart';

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



  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top:10 ,
              right: 10 ,
              left: 10 ,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [

                TextFieldAdaptavel(
                  controller: _tituloController,
                  onSubmitted: (_) => _submitForm(),
                  label: "Titulo",
                ),
                TextFieldAdaptavel(
                  controller: _valorController,
                  keyboardtype: TextInputType.number,
                  onSubmitted: (_) => _submitForm() ,
                  label: "Valor R\$",
                ),
                // novo componente
                DatepickerAdaptative(
                  dataSelecionadaController: _dataSelecionadaController,
                  onDateChanged: (newDate) {
                    setState(() {
                        _dataSelecionadaController = newDate;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BotaoAdaptavel(
                      label: 'Nova Transacao' ,
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
