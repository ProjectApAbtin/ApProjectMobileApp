import 'package:booktickets/utilis/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utilis/app_styles.dart';
import '../widegts/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic > ticket;
  const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return  SizedBox(
      width: size.width*0.85, //better scroll
      height: 200,

      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            //Abi
            Container(
              decoration: const BoxDecoration(
                color: const Color(0xFF526799),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(21),
                topRight: Radius.circular(21))
                
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text(ticket['from']['code'], style:Styles.headlineStyle3.copyWith(color: Colors.white),),

                      Expanded(child: Container()), //Vaghan injash zahmat dasht
                      ThickContainer(),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(

                            height: 24,
                            child: LayoutBuilder(

                              builder: (BuildContext context, BoxConstraints constraints) {
                                print("Width  =   ${constraints.constrainWidth()}") ; // pragma?
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                                    width: 3,height: 1,child:DecoratedBox(decoration: BoxDecoration(color: Colors.white),)
                                    ,
                                  )),
                                );
                              },

                            ),
                          ),
                          Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color: Colors.white,), )),

                        ],

                      )),
                      ThickContainer(),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'], style:Styles.headlineStyle3.copyWith(color: Colors.white),)
                    ],
                  ),
                  const Gap(3),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100, child: Text(ticket['from']['name'], style: Styles.headlineStyle4.copyWith(color: Colors.white),),

                      ),
                      Text(ticket['flying_time'] , style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                      SizedBox(
                        width: 100, child: Text(ticket['to']['name'], textAlign: TextAlign.end,style:Styles.headlineStyle4.copyWith(color: Colors.white),),

                      ),
                    ],
                  )
                ],
              ),
            ),
            //narenji paein
            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight : Radius.circular(10),
                            bottomRight: Radius.circular(10)

                          )
                        )
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                              width: 5,height: 1,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                              ),
                            )),
                          );
                        },
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft : Radius.circular(10),
                                bottomLeft: Radius.circular(10)

                            )
                        )
                    ),
                  )
                ],
              ),
            ),



            Container(
              decoration:  BoxDecoration(
                  color: Styles.orangeColor,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))

              ),
              padding: const EdgeInsets.only(left: 16, top: 10 , right: 10 , bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],style:Styles.headlineStyle3.copyWith(color: Colors.white) ,)
                        ,
                          const Gap(5),
                          Text("رفت", style: Styles.headlineStyle3.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'],style:Styles.headlineStyle3.copyWith(color: Colors.white) ,)
                          ,
                          const Gap(5),
                          Text("به وقت محلی", style: Styles.headlineStyle3.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("11 tir",style:Styles.headlineStyle3.copyWith(color: Colors.white) ,)
                          ,
                          const Gap(5),
                          Text("برگشت", style: Styles.headlineStyle3.copyWith(color: Colors.white),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
