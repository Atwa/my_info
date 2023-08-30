import 'form_field.dart';

class ValidationException extends Error {
  late final String message;
  late final FormField field;

  ValidationException(this.message,this.field);

}
