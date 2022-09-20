class Neederid{

  late String name;
  late String age;
  late String bloodtype;
  late String antigen;
  late String email;
  late String phone;
  late String add1;
  late String add2;
  late String state;
  late String country;
  late String phone2;

  Neederid({
    required this.name,
    required this.age,
    required this.bloodtype,
    required this.antigen,
    required this.email,
    required this.phone,
    required this.add1,
    required this.add2,
    required this.state,
    required this.country,
    required this.phone2
  });
  static Neederid fromJson(Map<String, dynamic> json) => Neederid(
      name: json['first'],
      age: json['age1'],
      bloodtype: json['blood'],
      antigen: json['antigen'],
      email: json['email'],
      phone: json['phone'],
      add1: json['add1'],
      add2: json['add2'],
      state: json['state'],
      country: json['country'],
      phone2: json['phone2']
  );
}