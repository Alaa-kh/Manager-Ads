import 'package:flutter/material.dart';
import 'package:manager_ads/app/data/helper/check_forms.dart';

//* Helper class for validating various form inputs such as name, email, password, and phone number.
class FormsValidate {
  static String? _oldPassword = '';

  //* Validates the 'name' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getNameValidate(BuildContext context, String name) {
    if (!CheckForms.checkEmpty(name)) {
      return 'Required Field';
    }

    if (name.length < 3) {
      return 'Name Invalid';
    }

    return null;
  }

  //* Validates the 'email' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmailValidate(BuildContext context, String email) {
    if (!CheckForms.checkEmpty(email)) {
      return 'Required Field';
    }

    if (!CheckForms.checkEmailRegex(email)) {
      return 'Email Invalid';
    }

    return null;
  }

  //* Validates the 'password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
static String? getPasswordValidate(
    BuildContext context,
    String password, {
    bool? isFillOldPassword,
  }) {
    if (!CheckForms.checkEmpty(password)) {
      return 'Required Field';
    }

    final passwordPattern = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
    );

    if (!passwordPattern.hasMatch(password)) {
      return 'Password must be at least 8 characters and include\n uppercase, lowercase, number, and special character';
    }

    if (isFillOldPassword != null && isFillOldPassword) {
      _oldPassword = password;
    }

    return null;
  }

static String? getConfirmPasswordValidate(
    BuildContext context,
    String confirmPassword,
    String originalPassword,
  ) {
    if (!CheckForms.checkEmpty(confirmPassword)) {
      return 'Required Field';
    }

    if (confirmPassword != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
  //* Validates the 'confirm password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getConfPasswordValidate(
    BuildContext context,
    String password,
  ) {
    if (!CheckForms.checkEmpty(password)) {
      return 'Required Field';
    }

    if (password != _oldPassword) {
      return "Password's Not Match";
    }

    return null;
  }

  //* Validates fields that should not be empty.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmptyValidate(BuildContext context, String value) {
    if (!CheckForms.checkEmpty(value)) {
      return 'Required Field';
    }

    return null;
  }

  //* Validates the 'phone number' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getPhoneNumberValidate(
    BuildContext context,
    String phoneNumber,
  ) {
    if (!CheckForms.checkEmpty(phoneNumber)) {
      return 'Required Field';
    }

    if (!CheckForms.checkPhoneNumberRegex(phoneNumber)) {
      return 'Number Invalid';
    }

    return null;
  }

  static String? getAgeValidate(BuildContext context, String ageStr) {
    if (ageStr.isEmpty) {
      return 'Required Field';
    }

    final age = int.tryParse(ageStr);
    if (age == null) {
      return 'Please enter a valid number';
    }

    if (age < 18 || age > 45) {
      return 'You must be between 18 and 45 years old';
    }

    return null;
  }




  static String? getCarNameValidate(BuildContext context, String carName) {
    if (!CheckForms.checkEmpty(carName)) {
      return 'Required Field';
    }

    if (carName.length < 3 || carName.length > 50) {
      return 'Car name must be between 3 and 50 characters';
    }

    return null;
  }


  static String? getCarColorValidate(BuildContext context, String carColor) {
    if (!CheckForms.checkEmpty(carColor)) {
      return 'Required Field';
    }

    if (carColor.length < 3 || carColor.length > 15) {
      return 'Car color must be between 3 and 15 characters';
    }

    return null;
  }


  static String? getCarNumberValidate(BuildContext context, String carNumber) {
    if (!CheckForms.checkEmpty(carNumber)) {
      return 'Required Field';
    }

    if (carNumber.length < 3 || carNumber.length > 50) {
      return 'Car number must be between 3 and 50 characters';
    }

    return null;
  }


 static String? getCarYearValidate(BuildContext context, String carYear) {
    if (!CheckForms.checkEmpty(carYear)) {
      return 'Required Field';
    }

    if (!RegExp(r'^\d{4}$').hasMatch(carYear)) {
      return 'Car year must be exactly 4 digits';
    }

    return null;
  }

}
