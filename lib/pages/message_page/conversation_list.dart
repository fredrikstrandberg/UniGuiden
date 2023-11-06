import '../students_page/student_list.dart';
import 'message.dart';

final Map<String, List<Message>> conversation = {

  "f@s.se" : [
    Message(
      student: students[students.indexWhere((student) => student.name == "Fredrik Strandberg")],
      accountSender: false,
      time: DateTime(2023,11,04,19,40),
      message: "Hej, jag känner så här.. långt meddelande som kommer krascha bla bla"
    ),
    Message(
        student: students[students.indexWhere((student) => student.name == "Fredrik Strandberg")],
        accountSender: true,
        time: DateTime(2023,11,04,19,40),
        message: "Tack för hjälpen!"
    ),
  ],
};

