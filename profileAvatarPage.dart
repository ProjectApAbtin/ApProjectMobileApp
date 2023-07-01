import 'package:booktickets/model/userA.dart';
import 'package:booktickets/screens/pf_screen.dart';
import 'package:booktickets/utilis/user_preferencess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utilis/app_styles.dart';
import '../widegts/button_widget.dart';
import '../widegts/numbers_widget.dart';
import '../widegts/profile_widget.dart';
import 'Vorod.dart';
import 'bodyone.dart';
import 'edit_profile_page.dart';
import 'hotel_screen.dart';

class ProfileA extends StatefulWidget {
  @override
  _ProfileAState createState() => _ProfileAState();
}

class _ProfileAState extends State<ProfileA> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Gap(10),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context)?.push(
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(user: UserPreferences.myUser),
                ),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 25),
          buildName(user),
          Gap(25),
          Center(child: buildUpgradeButton()),
          Gap(25),
          NumbersWidget(),
          Gap(50),
          buildAbout(user),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orangeAccent,
      title: Text('Profile'),
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        "Username : " + user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      Gap(5),
      Text(
        "Email : " + user.email,
        style: Styles.headlineStyle3.copyWith(color: Colors.blueGrey),
      ),
      Gap(5),
      Text(
        "Phone Number : " + user.PhoneNumber,
        style: Styles.headlineStyle3.copyWith(color: Colors.blueGrey),
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Update Information',
    onClicked: () {
      Navigator.pushNamed(context, '/UpdateInfo');
    },
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: Styles.headlineStyle1.copyWith(color: Colors.black),
        ),
        Gap(20),
        Text(
          user.about,
          style: Styles.headlineStyle3.copyWith(color: Colors.black),
        ),
        Gap(25),
      ],
    ),
  );
}