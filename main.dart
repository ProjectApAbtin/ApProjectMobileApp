import 'dart:io';

import 'package:booktickets/screens/bottom_bar.dart';
import 'package:booktickets/screens/edit_profile_page.dart';
import 'package:booktickets/screens/profileAvatarPage.dart';
import 'package:booktickets/screens/wallet_page.dart';
import 'package:booktickets/utilis/app_styles.dart';
import 'package:booktickets/utilis/user_preferencess.dart';
import 'package:flutter/material.dart';

 Future main() async{
WidgetsFlutterBinding.ensureInitialized();
await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,


      theme: ThemeData(
        primaryColor: primary,
        dividerColor : Colors.orangeAccent,
      ),
      home: const BottomBar(),


        routes: {
          '/UpdateInfo': (context) =>EditProfilePage(user: UserPreferences.myUser),
        }



    );
  } 
  //from here
  /*
  send(String names) async{
    String request = "send\nnames:$names,,me:ali\u0000";
    await Socket.connect("127.0.0.1", 1579).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response){
        print(String.fromCharCodes(response));
        setStat
      }

    }
  }

   */

}
