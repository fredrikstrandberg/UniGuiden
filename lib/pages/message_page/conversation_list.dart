import '../students_page/student_list.dart';
import 'message.dart';

final Map<String, List<Message>> conversation = {

  "john@doe.se" : [
    Message(
      student: students[students.indexWhere((student) => student.name == "Jesper Senke")],
      accountSender: false,
      time: DateTime(2023,11,04,19,40),
      message: "Hej, KTH har flera restauranger runt om på campus men jag brukar ta med mig matlåda, finns mikros både i sektionslokalerna och i kårhuset."
    ),
    Message(
        student: students[students.indexWhere((student) => student.name == "Jesper Senke")],
        accountSender: true,
        time: DateTime(2023,11,04,19,40),
        message: "Tack för hjälpen!"
    ),
  ],

};

