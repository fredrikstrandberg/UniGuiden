import 'account.dart';

final List<Account> accountList = [
  Account(
    email: "admin@admin.se",
    password: "admin",
    name: "admin",
    birthdate: "X"
  ),
  Account(
      email: "f@s.se",
      password: "pass",
      name: "Fredrik Strandberg",
      birthdate: "1999-12-27"
  ),
];

final Map<String, String> accountMap = {
  "admin@admin.se" : "admin",
  "f@s.se" : "pass",
};