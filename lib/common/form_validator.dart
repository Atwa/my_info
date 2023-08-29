import 'package:my_info/common/validator.dart';

class FormValidator implements Validator {
  @override
  bool aboveMinLength(String value, int minLength) =>
      (value.isNotEmpty && value.length >= minLength);

  @override
  bool belowMaxLength(String value, int maxLength) =>
      (value.isNotEmpty && value.length <= maxLength);

  @override
  bool isValidRegex(String value, String regex) {
    RegExp regExp = RegExp(regex);
    return regExp.hasMatch(value);
  }
}
