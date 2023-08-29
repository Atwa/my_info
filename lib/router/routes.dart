import 'package:flutter/cupertino.dart';
import 'package:my_info/feature/info/presentation/form_info_screen.dart';
import 'package:my_info/feature/location/presentation/location_screen.dart';
import 'package:my_info/feature/media/presentation/media_screen.dart';
import 'package:my_info/feature/recorder/presentation/recorder_screen.dart';
import 'package:my_info/router/route_constants.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) =>
      {
        RouteList.info: (context) => const FormInfoScreen(),
        RouteList.media: (context) => const MediaScreen(),
        RouteList.recorder: (context) => const RecorderScreen(),
        RouteList.location: (context) => const LocationScreen(),
      };
}