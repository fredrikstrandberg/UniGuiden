import 'post.dart';
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
