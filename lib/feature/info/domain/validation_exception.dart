import 'form_field_type.dart';

class ValidationException extends Error {
  late final String message;
  late final FormFieldType field;

  ValidationException(this.message,this.field);

}
