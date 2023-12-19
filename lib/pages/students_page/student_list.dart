import 'student.dart';
/*
final List<Student> students = [
  Student(
    name: "Fredrik Strandberg",
    age: 23,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Täby",
    imageName: "fredrik2.png",
    ambassador: false,
  ),
  Student(
    name: "Jesper Senke",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Vendelsö",
    imageName: "jesper.png",
    ambassador: false,
  ),
  Student(
    name: "Julia Stopner",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Vasastan",
    imageName: "julia.png",
    ambassador: true,
  ),
  Student(
    name: "Carl-Åke Willberg",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Täby",
    imageName: "carl-åke.png",
    ambassador: false,
  ),
  Student(
    name: "Lund Lundström",
    age: 21,
    university: "Lunds Universitet",
    program: "Ekonomi",
    year: 1,
    city: "Örebro",
    imageName: "profile.png",
    ambassador: true,
  ),

];*/


import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Student>> fetchStudents() async {
  print("fetching students");


  final url = Uri.parse('http://10.0.2.2:3000/getStudents');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //email finns registerad
    print("finns studenter");
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success'] == true) {
      print(data);
      final List<dynamic> studentsData = data['students'];
      final List<Student> students = studentsData.map((item) {
        return Student(
          name: item["name"],
          age: item["age"],
          university: item["universityName"],
          program: item["programID"],
          year: item["year"],
          city: item["city"],
          imagePath: item["imagePath"],
          ambassador: item["ambassador"],
        );
      }).toList();
      print("hämtat studenter");
      print(students);
      return students;
    } else {
      throw Exception('Failed to load universities');
    }
  } else {
    throw Exception('Failed to load universities');
  }
}


