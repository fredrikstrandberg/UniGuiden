import 'package:untitled/pages/students_page/student.dart';

class Request {

  Student receiver;
  String message;
  DateTime time;
  bool answered;
  bool accepted;

  Request({
    required this.receiver,
    required this.message,
    required this.time,
    required this.answered,
    required this.accepted,
  });

}