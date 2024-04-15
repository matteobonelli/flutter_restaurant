class Users{
  String? id;
  final String name;
  final String surname;
  final String email;
  final bool isOwner;

  Users({required this.name, required this.surname, required this.email, required this.isOwner});

  Map<String, dynamic> toJson(){
    return{
      'name' : name,
      'surname' : surname,
      'email' : email,
      'isOwner': isOwner
    };
  }

}