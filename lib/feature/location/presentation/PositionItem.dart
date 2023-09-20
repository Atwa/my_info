import 'package:my_info/feature/location/domain/PositionItemType.dart';
class PositionItem {
  PositionItem(this.type, this.displayValue);

  final PositionItemType type;
  final String displayValue;
}