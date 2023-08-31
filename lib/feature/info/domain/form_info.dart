import 'package:my_info/common/validator.dart';
import 'package:my_info/feature/info/domain/form_field_type.dart';
import 'package:my_info/feature/info/domain/validation_exception.dart';

class FormInfo {

  String _title = "";
  String _description = "";
  String _birthdate = "";
  String _phoneNumber = "";
  String _countryCode = "";

  late final Validator _validator;

  final int _titleMinLength = 10;
  final String _titleRegex = r'^[a-z A-Z,.\-]+$';
  final int _descriptionMinLength = 12;
  final String _birthdateFormat = r'^((1[0-2])|[1-9])[\/.](3[0-1]|[1-2]\d|[1-9])[\/.][19|20]\d{3}$';
  final int _phoneNumberLength = 10;
  final int _countryCodeLength = 4;
  final String _countryCodeFormat = r'^(\+?\d{1,3}|\d{1,4})$';

  FormInfo(this._validator, String title, String description, String birthdate,
      String phoneNumber, String countryCode) {
    setTitle(title);
    setDescription(description);
    setBirthdate(birthdate);
    setPhoneNumber(phoneNumber);
    setCountryCode(countryCode);
  }

  void setTitle(String title) {
    if (!_validator.aboveMinLength(title, _titleMinLength)) {
      throw ValidationException("Title must be at least $_titleMinLength chars.",FormFieldType.title);
    }
    if (!_validator.isValidRegex(title, _titleRegex)) {
      throw ValidationException("Title can't have special characters.",FormFieldType.title);
    }
    _title = title;
  }

  void setDescription(String description) {
    if (!_validator.aboveMinLength(description, _descriptionMinLength)) {
      throw ValidationException("Description must be at least $_descriptionMinLength chars.",FormFieldType.description);
    }
    _description = description;
  }

  void setBirthdate(String birthdate) {
    if (!_validator.isValidRegex(birthdate, _birthdateFormat)) {
      throw ValidationException("Birth date must match format mm/dd/yyyy.",FormFieldType.birthdate);
    }
    _birthdate = birthdate;
  }

  void setPhoneNumber(String phoneNumber) {
    if (!_validator.equalsLength(phoneNumber, _phoneNumberLength)) {
      throw ValidationException("Phone number must be $_phoneNumberLength numbers.",FormFieldType.phoneNumber);
    }
    _phoneNumber = phoneNumber;
  }

  void setCountryCode(String countryCode) {
    if (!_validator.belowMaxLength(countryCode, _countryCodeLength)) {
      throw ValidationException("Country code can't exceed $_countryCodeLength digits.",FormFieldType.countryCode);
    }
    if (!_validator.isValidRegex(countryCode, _countryCodeFormat)) {
      throw ValidationException("Invalid country code.",FormFieldType.countryCode);
    }
    _countryCode = countryCode;
  }

}
