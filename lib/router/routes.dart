import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_info/common/form_validator.dart';
import 'package:my_info/feature/info/domain/validate_info_use_case.dart';
import 'package:my_info/feature/info/presentation/form_info_cubit.dart';
import 'package:my_info/feature/info/presentation/form_info_screen.dart';
import 'package:my_info/feature/location/presentation/location_screen.dart';
import 'package:my_info/feature/media/presentation/media_screen.dart';
import 'package:my_info/feature/recorder/presentation/recorder_screen.dart';
import 'package:my_info/router/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.info: (context) => BlocProvider.value(
              value: FormInfoCubit(ValidateInfoUseCase(FormValidator())),
              child: const FormInfoScreen(),
            ),
        RouteList.media: (context) => const MediaScreen(),
        RouteList.recorder: (context) => const RecorderScreen(),
        RouteList.location: (context) => const LocationScreen(),
      };
}