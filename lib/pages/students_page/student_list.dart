import 'student.dart';

final List<Student> students = [
  Student(
      name: "Fredrik Strandberg",
      age: 23,
      university: "Kungliga Tekniska Högskolan",
      program: "Industriell Ekonomi",
      year: 5,
      city: "Täby",
      imageName: "fredrik2.png",
  ),
  Student(
    name: "Jesper Senke",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Vendelsö",
    imageName: "jesper.png",
  ),
  Student(
    name: "Julia Stopner",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Vasastan",
    imageName: "julia.png",
  ),
  Student(
    name: "Carl-Åke Willberg",
    age: 24,
    university: "Kungliga Tekniska Högskolan",
    program: "Industriell Ekonomi",
    year: 5,
    city: "Täby",
    imageName: "carl-åke.png",
  ),
  Student(
    name: "John Doe",
    age: 35,
    university: "Lunds Universitet",
    program: "Ekonomi",
    year: 1,
    city: "Örebro",
    imageName: "profile.png",
  ),

];
/*


import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<University>> fetchUniversities() async {
  print("fetching unis");


  final url = Uri.parse('http://10.0.2.2:3000/getUniversities');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //email finns registerad
    print("finns universitet");
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success'] == true) {
      final List<dynamic> universitiesData = data['universities'];
      final List<University> universities = universitiesData.map((item) {
        return University(
          name: item['name'],
          city: item['city'],
          imagePath: item['imagePath'], // Använd imagePath istället för imageName
          description: item['uniDescription'],
        );
      }).toList();
      return universities;
    } else {
      throw Exception('Failed to load universities');
    }
  } else {
    throw Exception('Failed to load universities');
  }
}
*/


