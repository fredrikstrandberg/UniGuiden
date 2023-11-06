import 'package:untitled/pages/message_page/request.dart';
import '../students_page/student.dart';

final Map<String, List<Request>?> accountSentRequests = {
  "admin@admin.se" : [],
  "f@s.se" : [
    Request( // testRequest
      receiver: Student(
        name: "Fredrik Strandberg",
        age: 23,
        university: "Kungliga Tekniska Högskolan",
        program: "Industriell Ekonomi",
        year: 5,
        city: "Täby",
        imageName: "fredrik2.png",
        ambassador: false,
      ),
      message: "Jag vill ha svar på: ...",
      time: DateTime(2023,11,04,18,40),
      answered: true,
      accepted: true,
    )
  ],
};