class User {
  final int id;
  final String email;
  final String name;

  User({required this.id, required this.email, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    final role = json['role'];

    switch (role) {
      case 'highschool':
        return HighSchoolStudent.fromJson(json);
      case 'university':
        return UniversityStudent.fromJson(json);
      case 'admin':
        return AdminUser.fromJson(json);
      default:
        throw Exception('Okänd användarroll: $role');
    }
  }
}

class HighSchoolStudent extends User {
  final String birthdate;
  final String highschool;
  final String education;
  final String city;
  final String imagePath;

  HighSchoolStudent({
    required int id,
    required String email,
    required String name,
    required this.birthdate,
    required this.highschool,
    required this.education,
    required this.city,
    required this.imagePath,
  }) : super(id: id, email: email, name: name);

  factory HighSchoolStudent.fromJson(Map<String, dynamic> json) {
    // Skapa en instans av HighSchoolStudent från JSON-data
    return HighSchoolStudent(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      birthdate: json['birthdate'],
      highschool: json['highschool'],
      education: json['education'],
      city: json['city'],
      imagePath: json['imagePath'],
    );
  }
}

class UniversityStudent extends User {
  final int age;
  final String universityID;
  final String programID;
  final int year;
  final String city;
  final String imagePath;

  UniversityStudent({
    required int id,
    required String email,
    required String name,
    required this.age,
    required this.universityID,
    required this.programID,
    required this.year,
    required this.city,
    required this.imagePath,
  }) : super(id: id, email: email, name: name);

  factory UniversityStudent.fromJson(Map<String, dynamic> json) {
    // Skapa en instans av UniversityStudent från JSON-data
    return UniversityStudent(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      age: json['age'],
      universityID: json['universityID'],
      programID: json['programID'],
      year: json['year'],
      city: json['city'],
      imagePath: json['imagePath'],
    );
  }
}

class AdminUser extends User {
  // Extra attribut för administratörer
  final String adminRole;

  AdminUser({
    required int id,
    required String email,
    required String name,
    required this.adminRole,
  }) : super(id: id, email: email, name: name);

  factory AdminUser.fromJson(Map<String, dynamic> json) {
    // Skapa en instans av AdminUser från JSON-data
    return AdminUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      adminRole: json['adminRole'],
    );
  }
}
