import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.orangeAccent,

    elevation: 0,
    actions: [
      IconButton(

          icon: Icon(Icons.print),
        onPressed: (){},
      )
    ],
  );
}