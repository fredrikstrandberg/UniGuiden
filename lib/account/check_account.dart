import 'package:email_validator/email_validator.dart';
import 'account_list.dart';
import 'handle_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


checkAccount(context, email, password, repeatPassword) async {
  bool validEmail = EmailValidator.validate(email);
  bool passInput = password.toString().isNotEmpty;
  bool repeatPassInput = repeatPassword.toString().isNotEmpty;
  //List regEmails = accountMap.keys.toList();
  // bool passLengthCheck = (password.toString().length >= 8);

  if (!validEmail || !passInput || !repeatPassInput) {
    if (!validEmail) {
      return handleLoginError(context, "Fyll i en giltig email");
    }
    else {
      if (!passInput) {
        return handleLoginError(context, "Fyll i lösenord");
      }
      else {
        return handleLoginError(context, "Upprepa lösenord");
      }
    }
  }
  else {
    // if (regEmails.contains(email)) {
    //   return handleLoginError(context, "Email är redan registrerad");
    // }
    bool emailExist = await checkEmailExist(email);

    if (emailExist) {
      print("epost finns");
      handleLoginError(context, "Email är redan registrerad");
      return false;

    }
    else if (password != repeatPassword) {

      handleLoginError(context, "Lösenorden stämmer inte överens");
      return false;
    }
    else {
      print("epost finns inte");

      return true;
    }
  }
}


checkEmailExist(String email) async {
  email = email.toLowerCase();

  // Skapa ett JSON-objekt med användarinformation
  final Map<String, dynamic> userData = {
    'email': email,
  };
  //final url = Uri.http("10.0.2.2:3000", "/login");
  final url = Uri.parse('http://10.0.2.2:3000/checkEmailexist');
  final response = await http.post(url,

    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(userData),
  );
  if (response.statusCode == 200) {
    //email finns registerad
    print("email exist");
    return true;
  }else {
    print("email finns inte registrerad");
    return false;
    // Något gick fel vid förfrågan till servern, du kan hantera det här
  }
}
