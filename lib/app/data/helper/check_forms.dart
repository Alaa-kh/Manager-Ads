
//* Utility class for form input validation using regular expressions and basic checks.
import 'package:manager_ads/app/core/constants/app_regular_exp.dart';

class CheckForms {
  //* Checks if the provided [value] matches the name regular expression.
  // static bool checkNameRegex(String value) {
  //   final regex = RegExp(
  //     AppRegularExpressions.name,
  //     caseSensitive: false,
  //     unicode: true,
  //   );
  //   return regex.hasMatch(value);
  // }

  //* Checks if the provided [value] matches the email regular expression.
  static bool checkEmailRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.emailRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

  //* Checks if the provided [value] matches the password regular expression.
  static bool checkPasswordRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.passwordRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

  //* Checks if the provided [value] matches the phone number regular expression.
  static bool checkPhoneNumberRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.phoneNumberRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

  //* Checks if the provided [value] is not empty.
  static bool checkEmpty(String value) {
    // Returns false if the value is empty, true otherwise.
    return value.isNotEmpty;
  }

   static bool checkAgeRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.ageRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

}
