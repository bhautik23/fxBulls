class User {
  String email;
  String firstName;
  String lastName;
  String country;
  String city;
  String phone;
  String thumb;
  String latitude;
  String logitude;
  int inviteCode;

  User(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.country,
      required this.city,
      required this.phone,
      required this.thumb,
      required this.latitude,
      required this.logitude,
      required this.inviteCode}); // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      inviteCode: responseData['id'],
      firstName: responseData['first_name'],
      lastName: responseData['last_Name'],
      email: responseData['Email'],
      country: responseData['Country'],
      city: responseData['City'],
      thumb: responseData['Thumb'],
      latitude: responseData['Latitude'],
      logitude: responseData['Logitude'],
      phone: responseData['Phone'],
    );
  }
}
