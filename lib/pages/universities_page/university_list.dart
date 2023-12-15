import 'package:untitled/pages/universities_page/university_description.dart';
import 'university.dart';

/*
final List<University> universities = [
  University(
      name: "Kungliga Tekniska Högskolan",
      city: "Stockholm",
      imageName: "kth.png",
      description: "KTH bla bla bla",
      website: "www.kth.se",
  ),
  University(
      name: "Lunds Universitet",
      city: "Lund",
      imageName: "lund.png",
      description: "Lund bla bla bla",
      website: "www.lu.se",
  ),
  University(
    name: "Uppsala Universitet",
    city: "Uppsala",
    imageName: "uppsala.png",
    description: "Uppsala bla bla bla",
    website: "www.uu.se",
  ),
  University(
    name: "Stockholms Universitet",
    city: "Stockholm",
    imageName: "SU.png",
    description: "SU bla bla bla",
    website: "www.su.se",
  ),
  University(
    name: "Chalmers Tekniska Högskola",
    city: "Göteborg",
    imageName: "chalmers.png",
    description: "Chalmers bla bla bla",
    website: "www.chalmers.se",
  ),
  University(
    name: "Örebro Universitet",
    city: "Örebro",
    imageName: "örebro.png",
    description: "Örebro bla bla bla",
    website: "www.oru.se",
  ),
];*/

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

