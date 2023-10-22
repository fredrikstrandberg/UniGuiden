const String tableStudents = 'students';


class StudentFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String age = 'age';
  static const String universityID = 'universityID';
  static const String programID = 'programID';
  static const String year = 'year';
  static const String city = 'city';
  static const String image = 'image';

}

class Student {
  final int id;
  final String name;
  final int age;
  final String university;
  final String program;
  final int year;
  final String city;
  final String image;

  const Student({
    required this.id,
    required this.name,
    required this.age,
    required this.university,
    required this.program,
    required this.year,
    required this.city,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'age': age,
      'universityID': university,
      'programID': program,
      'year': year,
      'city': city,
      'image': image,
    };


  }
}