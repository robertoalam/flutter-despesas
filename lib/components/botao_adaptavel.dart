import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoAdaptavel extends StatelessWidget {

  final String label;
  final Function onPressed;

  BotaoAdaptavel({ this.label , this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ?
    CupertinoButton(
      child: Text( label ),
      onPressed: onPressed ,
      color: Theme.of(context).primaryColor,
    )
        :
    RaisedButton(
      child: Text( label ),
      onPressed: onPressed ,
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).textTheme.button.color,

    );

  }
}
