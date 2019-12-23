import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextViewer extends StatelessWidget{
  final String _text;

  TextViewer(this._text);

  @override
  Widget build(BuildContext context){
    return  Container(
      child: Text(_text),
    );
  }
}