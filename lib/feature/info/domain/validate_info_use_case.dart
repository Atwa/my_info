import 'package:either_dart/either.dart';
import 'package:my_info/feature/info/domain/form_info.dart';
import 'package:my_info/feature/info/domain/validation_exception.dart';

import '../../../common/validator.dart';

class ValidateInfoUseCase {

  final Validator _validator;

  ValidateInfoUseCase(this._validator);

  Future<Either<ValidationException, bool>> call(String title, String description,
      String birthdate, String phoneNumber, String countryCode) async {
    try {
      FormInfo formInfo = FormInfo(_validator, title, description, birthdate, phoneNumber, countryCode);
      return const Right(true);
    } on ValidationException catch (e){
      return Left(e);
    }
  }


}
