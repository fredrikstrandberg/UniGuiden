import '../../account/account.dart';
import '../students_page/student.dart';

class Message {

  bool accountSender;
  Student student;
  String message;
  DateTime time;


  Message({
    required this.accountSender,
    required this.student,
    required this.message,
    required this.time,
  });

}