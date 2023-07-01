class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final String Gender;
  final bool isDarMode;
  final String PhoneNumber;
  final String BirthDay;



  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarMode, required this.Gender, required this.PhoneNumber, required this.BirthDay,


});
  User copy( {
  String? imagePath,
 String? name,
    String? email,
   String? about,
 String? Gender,
     bool? isDarMode,
    String? PhoneNumber,
  String? BirthDay,
})=>
  User(imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      email: email ?? this.email,
      about: about ?? this.about,
      isDarMode: isDarMode ?? this.isDarMode,
      Gender: Gender ?? this.Gender,
      PhoneNumber: PhoneNumber??  this.PhoneNumber,
      BirthDay: BirthDay ?? this.BirthDay
  );
  static User fromJson(Map<String , dynamic> json)=> User(
    imagePath: json['imagePath'],
    name : json['name'],
    email: json['email'],
    about: json['about'],
    PhoneNumber: json['PhoneNumber'],
    BirthDay : json['BirthDay'],
    isDarMode: json['isDarmode'],
    Gender: json['Gender'],

  );
  Map<String ,dynamic> toJson() =>{
  'imagePath' : imagePath,
  'name' : name,
  'email' :  email,
  'about': about,
  'gender': Gender,
  'isDarmode' : isDarMode,
  'PhoneNumber': PhoneNumber,
  'BirthDay' : BirthDay,

  };


}