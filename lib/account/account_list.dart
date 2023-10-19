import '../model/account.dart';

final List<Account> accountList = [
  Account(
    email: "admin@admin.se",
    name: "admin",
    birthdate: "X", password: '123'
  ),
  Account(
      email: "f@s.se",
      name: "Fredrik Strandberg",
      birthdate: "1999-12-27", password: '123'
  ),
];

final Map<String, String> accountMap = {
  "admin@admin.se" : "admin",
  "f@s.se" : "pass",
};