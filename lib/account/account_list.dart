import 'account.dart';

final List<Account> accountList = [
  Account(
    email: "admin@admin.se",
    password: "admin",
    name: "admin",
    birthdate: "2000-01-01",
    highschool: "N/A",
    education: "N/A",
    city: "N/A",
    description: "",
  ),
  Account(
      email: "f@s.se",
      password: "pass",
      name: "Fredrik Strandberg",
      birthdate: "1999-12-27",
      highschool: "Tibble Gymnasium",
      education: "Ekonomi",
      city: "Täby",
      description: "",
  ),
];

final Map<String, String> accountMap = {
  "admin@admin.se" : "admin",
  "f@s.se" : "pass",
};