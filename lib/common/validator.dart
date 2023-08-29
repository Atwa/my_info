abstract class Validator {

  bool aboveMinLength(String value, int minLength);
  bool belowMaxLength(String value, int maxLength);
  bool isValidRegex(String value, String regex);

}
