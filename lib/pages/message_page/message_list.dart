import 'message.dart';

final List<Message> messages = [
  Message(
      contact: "Fredrik Strandberg",
      contactImage: "fredrik2.png",
      message: "Hej! Ja absolut, skulle det funka att prata på fredag vid 15?",
      sender: "Fredrik Strandberg",
      time: DateTime.now()
  ),
  Message(
    contact: "Jesper Senke",
    contactImage: "jesper.png",
    message: "Jag kan...",
    sender: "Jesper Senke",
    time: DateTime.now().subtract(const Duration(hours: 1))
  ),
  Message(
    contact: "John Doe",
    contactImage: "lund.png",
    message: "Klockan 14 på torsdag?",
    sender: "John Doe",
      time: DateTime.now().subtract(const Duration(days: 2, hours: 2))
  ),
];
