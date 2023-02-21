class Customer {
  String userId;
  String firstName;
  String lastName;
  String birthDate;
  String nicId;
  int phoneNumber;
  String email;
  String profilePicture;
  String pin;

  Customer({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.nicId,
    required this.phoneNumber,
    required this.email,
    required this.profilePicture,
    required this.pin,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: json['birthDate'],
      nicId: json['nicId'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      pin: json['pin'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthDate'] = birthDate;
    data['nicId'] = nicId;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['profilePicture'] = profilePicture;
    data['pin'] = pin;
    return data;
  }
}
