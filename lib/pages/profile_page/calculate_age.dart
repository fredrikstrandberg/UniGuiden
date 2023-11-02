

calculateAge(birthdate) {
  DateTime currentDate = DateTime.now();
  DateTime birthDateFormatted = DateTime.parse(birthdate);
  int age = currentDate.year - birthDateFormatted.year;
  int month1 = currentDate.month;
  int month2 = birthDateFormatted.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDateFormatted.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}