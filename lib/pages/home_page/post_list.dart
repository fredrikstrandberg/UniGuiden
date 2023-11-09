import 'post.dart';

/*final List<Post> posts = [
  Post(
      university: "Kungliga Tekniska Högskolan",
      title: "Öppet Hus",
      date: "12e Januari 10:00 - 16:00",
      place: "KTH Bibliotek, Osquars backe 31, 114 28 Stockholm",
      description:
      "Den 12e Januari välkomnar vi dig som funderar på att studera på KTH på öppet hus.\n"
          "Du kommer att kunna träffa oss som jobbar på KTH samt några av våra studenter. "
          "Du kommer kunna ställa frågor och bekanta dig med vårt stora och fina campus.\n\n"
          "Varmt välkommen!",
      imageName: "kth.png",
      saved: false,
  ),
  Post(
      university: "Lunds Universitet",
      title: "Öppet Hus",
      date: "17e Februari 12:00 - 15:00",
      place: "Universitetsbiblioteket, Helgonavägen 2, 223 62 Lund",
      description:
      "Den 17e Februari öppnar Lunds Universitet dörrarna för dig som vill veta mer om vårt universitet.\n\n"
          "Välkommen!",
      imageName: "lund.png",
      saved: false,
  ),
  Post(
      university: "Test",
      title: "Test",
      date: "Datum",
      place: "Plats",
      description:
      "Beskrivning",
      imageName: "profile.png",
      saved: false,
  ),
  Post(
    university: "Test",
    title: "Test",
    date: "Datum",
    place: "Plats",
    description:
    "Beskrivning",
    imageName: "profile.png",
    saved: false,
  ),
  Post(
    university: "Test",
    title: "Test",
    date: "Datum",
    place: "Plats",
    description:
    "Beskrivning",
    imageName: "profile.png",
    saved: false,
  ),

];*/



import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {
  print("fetching posts");


  final url = Uri.parse('http://10.0.2.2:3000/getUniversityPosts');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //email finns registerad
    print("finns posts");
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success'] == true) {
      final List<dynamic> postsData = data['posts'];
      final List<Post> posts = postsData.map((item) {
        return Post(
            university: item['universityName'],
            title: item['title'],
            date: item['date'],
            place: item['place'],
            description: item['description'],
            imageName: item['imagePath'],
            saved: false,
          );
      }).toList();
      return posts;
    } else {
      throw Exception('Failed to load universities');
    }
  } else {
    throw Exception('Failed to load universities');
  }
}
