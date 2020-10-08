import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TextEditingController tituloController = TextEditingController();
  TextEditingController valorController = TextEditingController();

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
              decoration: InputDecoration(
                  labelText: "Titulo"
              ),
            ),
            TextField(
              controller: valorController,
              decoration: InputDecoration(
                  labelText: "Valor R\$"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: (){
                    print(tituloController);
                    print(valorController);
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
