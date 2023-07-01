import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Personal Information'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            TextButton(
              child: Text('Wallet'),
              onPressed: () {
                Navigator.pushNamed(context, '/wallet');
              },
            ),
            TextButton(
              child: Text('Recent Trips'),
              onPressed: () {
                Navigator.pushNamed(context, '/recent_trips');
              },
            ),
            TextButton(
              child: Text('Log Out'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

















/*
class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String name = 'Ali';
  String familyName = 'B';
  String birthday = '2222';
  String nationality = 'Ir';
  String gender = 'Male';

  late TextEditingController _nameController;
  late TextEditingController _familyNameController;
  late TextEditingController _birthdayController;
  late TextEditingController _nationalityController;
  late TextEditingController _genderController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: name);
    _familyNameController = TextEditingController(text: familyName);
    _birthdayController = TextEditingController(text: birthday);
    _nationalityController = TextEditingController(text: nationality);
    _genderController = TextEditingController(text: gender);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _familyNameController.dispose();
    _birthdayController.dispose();
    _nationalityController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  void _onSave() {
    setState(() {
      name = _nameController.text;
      familyName = _familyNameController.text;
      birthday = _birthdayController.text;
      nationality = _nationalityController.text;
      gender = _genderController.text;
    });
  }

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType type) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onSave,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Name', _nameController, TextInputType.text),
            _buildTextField(
                'Family Name', _familyNameController, TextInputType.text),
            _buildTextField(
                'Birthday Date', _birthdayController, TextInputType.datetime),
            _buildTextField(
                'Nationality', _nationalityController, TextInputType.text),
            _buildTextField('Gender', _genderController, TextInputType.text),
          ],
        ),
      ),
    );
  }
}*/

