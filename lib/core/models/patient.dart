class Patient {
  final String firstName;
  final String sex;
  final int age;
  final String secondName;
  final String email;
  final String password;
  final String babyName;
  final String phone;
  final String babyGender;

  Patient(
      {required this.firstName,
      required this.sex,
      required this.age,
      required this.secondName,
      required this.email,
      required this.password,
      required this.babyName,
      required this.phone,
      required this.babyGender});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      sex: json['sex'],
      age: json['age'],
      babyName: json['babyName'],
      phone: json['phone'],
      babyGender: json['babyGender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'secondName': secondName,
      'sex': sex,
      'age': age,
      'babyName': babyName,
      'phone': phone,
      'babyGender': babyGender,
    };
  }
}
