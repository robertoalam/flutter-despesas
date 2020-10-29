import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldAdaptavel extends StatelessWidget {

  final String label;
  final TextInputType keyboardtype;
  final controller;
  final Function(String) onSubmitted;

  TextFieldAdaptavel({
    this.label ,
    this.controller ,
    this.keyboardtype = TextInputType.text,
    this.onSubmitted ,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ?
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: keyboardtype,
            onSubmitted: onSubmitted,
            placeholder: label,
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12 ,
            ),
          ),
        )
      :
        TextField(
          controller: controller,
          keyboardType: keyboardtype,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              labelText: label
          ),
        )
      ;
  }
}
