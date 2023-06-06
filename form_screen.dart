import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormScreenState();

}


class _FormScreenState extends State<FormScreen>{
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: Text("Ali BabBa"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 60 ), // Added comma after horizontal value
          child: Form(
            key: _formfield, // Added key to Form
            child: Column(children: [
              SizedBox(height: 50), // Added missing closing parenthesis
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  RegExp regex = RegExp(r'^[a-zA-Z0-9\.]+@gmail\.com$');
                  bool isValid = regex.hasMatch(value);
                  if(!isValid){
                    return "A valid email address";
                  }
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
                obscureText: passToggle, // Added obscureText property
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

                  }
                  return null;
                }, // Added validator function
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: (){
                  if (_formfield.currentState!.validate()) {
                    // Do something when the form is valid
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Log in" , style: TextStyle(
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
                  TextButton(onPressed: (){}, child: Text("Sign up",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
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



