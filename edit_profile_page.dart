import 'package:booktickets/screens/bodyone.dart';
import 'package:booktickets/utilis/user_preferencess.dart';
import 'package:booktickets/widegts/button_widget.dart';
import 'package:booktickets/widegts/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import '../model/userA.dart';
import '../widegts/TextFieldWidget.dart';
class EditProfilePage extends StatefulWidget{
  final User user;

  EditProfilePage({required this.user});

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  Widget build(BuildContext context) =>
      Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 35),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,

              onClicked: () async {},
            ),
            Gap(25),
            TextFieldWidget(
              label: "Full Name",
              text: user.name,
              onChanged: (name)=> user.copy(name : name), //copy dast saz
            ),
            Gap(25),
            TextFieldWidget(
              label: "Email address",
              text: user.email,
              onChanged: (email) =>user.copy(email : email),
            ),
            Gap(25),
            TextFieldWidget(
              label: "Phone Number",
              text: user.PhoneNumber,
              onChanged: (PhoneNumber) =>user.copy(PhoneNumber : PhoneNumber),
            ),
            Gap(25),
            TextFieldWidget(
              label: "Birthday",
              text: user.BirthDay,
              onChanged: (BirthDay) => user.copy(BirthDay: BirthDay),
                //(BirthDay) => user=user.copy(BirthDay = BirthDay),
               /* RegExp regex = RegExp(r'^\d{4}/\d{2}/\d{2}$');
                if (!regex.hasMatch(date)) {
                  // Show error message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Invalid date"),
                        content: Text("The date must be in  format of yyyy/mm/dd."),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }
              },

                */
            ),
            Gap(25),
            TextFieldWidget(
              label: "About",
              text: user.about,
              maxLines: 2,
              onChanged: (about) => user = user.copy(about: about),
            ),
            Gap(25),
            ButtonWidget(text: 'Save', onClicked: () {
              UserPreferences.setUser(user);
              Navigator.of(context).pop();

            }),

          ],
        ),
      );

}
