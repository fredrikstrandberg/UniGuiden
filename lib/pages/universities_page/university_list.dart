import 'package:untitled/pages/universities_page/university_description.dart';
import 'university.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<University>> fetchUniversities() async {
  final url = Uri.parse('http://10.0.2.2:3000/getUniversities');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //email finns registerad
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success'] == true) {
      final List<dynamic> universitiesData = data['universities'];
      final List<University> universities = universitiesData.map((item) {
        return University(
          name: item['name'],
          city: item['city'],
          imagePath: item['imagePath'], // Använd imagePath istället för imageName
          description: item['uniDescription'],
          website: item['website'],
        );
      }).toList();
      print(universities);
      return universities;

    } else {
      throw Exception('Failed to load universities');
    }
  } else {
    throw Exception('Failed to load universities');
  }
}

