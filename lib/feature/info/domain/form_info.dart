import 'package:my_info/common/validator.dart';
import 'package:my_info/feature/info/domain/validation_exception.dart';

class FormInfo {
  String _title = "";
  String _description = "";
  String _birthDate = "";
  String _phoneNumber = "";
  String _countryCode = "";
  late Validator _validator;

  final int _titleMinLength = 10;
  final String _titleRegex = r'^[a-z A-Z,.\-]+$';
  final int _descriptionMinLength = 12;
  final String _birthDateFormat = r'^((1[0-2])|[1-9])[/-.](3[0-1]|[1-2]\d|[1-9])[/-.][19|20]\d{2}$';
  final int _phoneNumberLength = 10;
  final int _countryCodeLength = 4;
  final String _countryCodeFormat = r'^(\+?\d{1,3}|\d{1,4})$';

  FormInfo(this._validator, String title, String description, String birthDate,
      String phoneNumber, String countryCode) {
    setTitle(title);
    setDescription(description);
    setBirthDate(birthDate);
    setPhoneNumber(phoneNumber);
    setCountryCode(countryCode);
  }

  void setTitle(String title) {
    if (!_validator.aboveMinLength(title, _titleMinLength)) {
      throw ValidationException("Title must be at least $_titleMinLength chars.");
    }
    if (!_validator.isValidRegex(title, _titleRegex)) {
      throw ValidationException("Title can't have special characters.");
    }
    _title = title;
  }

  void setDescription(String description) {
    if (!_validator.aboveMinLength(description, _descriptionMinLength)) {
      throw ValidationException("Description must be at least $_descriptionMinLength chars.");
    }
    _description = description;
  }

  void setBirthDate(String birthDate) {
    if (!_validator.isValidRegex(birthDate, _birthDateFormat)) {
      throw ValidationException("invalid birth date, Please use format dd/mm/yyyy.");
    }
    _birthDate = birthDate;
  }

  void setPhoneNumber(String phoneNumber) {
    if (!_validator.aboveMinLength(phoneNumber, _phoneNumberLength)) {
      throw ValidationException("Phone number must be at least $_phoneNumberLength numbers.");
    }
    _phoneNumber = phoneNumber;
  }

  void setCountryCode(String countryCode) {
    if (!_validator.belowMaxLength(countryCode, _countryCodeLength)) {
      throw ValidationException("Country code must be at least $_countryCodeLength chars.");
    }
    if (!_validator.isValidRegex(countryCode, _countryCodeFormat)) {
      throw ValidationException("Invalid country code.");
    }
    _countryCode = countryCode;
  }

}
