
class AppRegularExpressions {

  static const String emailRegExp =
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

  static const String passwordRegExp =
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";

  static const String phoneNumberRegExp = r'^\d{10,15}$';
  static const String ageRegExp = r'^(1[89]|[2-3][0-9]|4[0-5])$';

}
