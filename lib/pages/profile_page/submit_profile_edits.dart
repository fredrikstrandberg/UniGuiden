import '../../global_variables.dart';

submitProfileEdits(updName, updHighschool, updEducation, updCity, updBirthdate, updDescription) {
  GlobalVariables.curLoggedIn.name = updName;
  GlobalVariables.curLoggedIn.highschool = updHighschool;
  GlobalVariables.curLoggedIn.education = updEducation;
  GlobalVariables.curLoggedIn.city = updCity;
  GlobalVariables.curLoggedIn.birthdate = updBirthdate;
  GlobalVariables.curLoggedIn.description = updDescription;
}