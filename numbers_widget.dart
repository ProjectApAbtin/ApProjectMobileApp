import 'package:booktickets/utilis/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NumbersWidget extends StatelessWidget {
  Widget build(BuildContext context) => IntrinsicHeight(
     child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '250', 'Score'),
          buildDivider(),
          buildButton(context, '5', 'Trips number'),
          buildDivider(),
          buildButton(context, '0\$', 'Wallet'),
        ],

      ),
  );
  Widget buildDivider()=> VerticalDivider();

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        child:Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: Styles.headlineStyle1.copyWith(color: Colors.black),
            ),
            Gap(4),
            Text(
              text,
              style: Styles.headlineStyle3.copyWith(color: Colors.black),
            ),
          ],
        ) ,

      );
}