import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
}) :  super(key: key);

  Widget build(BuildContext context)=> ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),

      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 45,vertical: 20),
    ),

    child: Text(text),
    onPressed: onClicked,


  );

}
