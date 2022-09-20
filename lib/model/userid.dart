class Userid{
  late String name;
  late String last;
  late String blood;
  late String antigen;
  late String age;
  late String city;
  late String state;
  late String country;
  late String email;
  late String phone;

  Userid({
    required this.name,
    required this.last,
    required this.blood,
    required this.antigen,
    required this.age,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phone
    });
  static Userid fromJson(Map<String, dynamic> json) => Userid(
    name: json['first'],
    last: json['last'],
    blood: json['blood'],
    antigen: json['antigen'],
    age: json['age1'],
    city: json['add3'],
    state: json['state'],
    country: json['country'],
    email: json['email'],
    phone: json['phone']
  );
}