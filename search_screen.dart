import 'package:booktickets/utilis/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utilis/app_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor:Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          const Gap(40),
          Text(
            "What are\nyou looking for?" , style: Styles.headlineStyle1.copyWith(fontSize: 35),
          ),
          Gap(20),
          Container(
            child: Row(
              children: [
                Container(
                  width: size.width*.44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,

                  ),
                  child: Text("Airline tickets"),

                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF4F6FD),

            ),
          )
        ],
      ),

    );
  }
}
