import 'package:booktickets/store/store.dart';
import 'package:flutter/material.dart';

import 'LogInpage.dart';

class FormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormScreenState();

}


class _FormScreenState extends State<FormScreen>{
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameSignController =  TextEditingController();
  bool passToggle = true;
  String temp="";
  String temp2="";
  String userName="a";
  String pAssWord="a";
  String EmaiL = "a";


  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,

        title: Text("Ali BabBa"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 60 ), // Added comma after horizontal value
          child: Form(
            key: _formfield, // Added key to Form
            child: Column(children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                controller: usernameSignController,
                decoration: InputDecoration(
                  labelText: "UserName",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged:(value){
                  userName=value;
                } ,
                validator: (value) {

                  if (value!.isEmpty) {
                    return 'Please enter an username for yourself';
                  }

                  if(userTest.contains(value)){

                    return value + " user name has been chosen";
                  }
                  if(!userTest.contains(value)){
                    userTest.add(value);
                  }
                  temp2=value;

                  userName=value;

                  return null;
                }, // Added validator function
              ),
              SizedBox(height: 25), // Added missing closing parenthesis
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),onChanged:(value){
                EmaiL=value;
              } ,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  RegExp regex = RegExp(r'^[a-zA-Z0-9\.]+@gmail\.com$');
                  bool isValid = regex.hasMatch(value);
                  if(!isValid){
                    return "Enter a valid email address";
                  }
                  if(emailTest.contains(value)){
                    return "this email has been used by another user";
                  }
                  if(isValid){
                    emailTest.add(value);
                    temp=value;
                  }
                  EmaiL=value;
                  return null;
                }, // Added validator function
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                controller: passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffix: InkWell(
                    onTap: (){
                      setState(() {
                        passToggle= !passToggle;
                      });
                    },
                    child: Icon(passToggle ? Icons.visibility : Icons.visibility_off ),
                  ),
                ),
                obscureText: passToggle,
                onChanged:(value){
                  pAssWord=value;
                } ,// Added obscureText property
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }else{
                    if(value.length<8){
                      return "The password contains at least 8 words";
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'The password should contains at least one number';
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'The password should contains at least one small letter';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'The password should contains at least one capital letter';
                    }
                    int debug=0;
                    for(int i=0 ; i<value.length ; i++){
                      if(value.contains("a")){
                        debug++;
                      }
                    }

                    if(debug<1 && !RegExp(r'[0-1]').hasMatch(value)){
                      return "The password should contains at least two (a) letter or consist a number (base 2)";
                    }
                    bool hasConsecutiveNumbers(String input) {
                      RegExp regExp = RegExp(r'\d{2,}');
                      return regExp.hasMatch(input);
                    }
                    if(hasConsecutiveNumbers(value)){
                      return "Your password is weak";
                    }
                    infoTest.putIfAbsent(temp, () => value);
                    infoTest2.putIfAbsent(temp2, () =>value);
                    pAssWord=value;


                  }
                  return null;
                }, // Added validator function
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: (){print(userName);
                  if (_formfield.currentState!.validate()) {

                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Sign in" ,

                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(
                    fontSize: 16,
                  ),), // Added missing comma
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LogInpage()),
                );
              },
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),


                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}