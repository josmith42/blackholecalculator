import 'package:fling_units/fling_units.dart';

class UnitWrapper<T extends Dimension> {
  final Unit<T> unit;

  UnitWrapper(this.unit);

  @override
  operator ==(Object other) =>
      other is UnitWrapper<T> &&
      unit == other.unit &&
      unit.prefix == other.unit.prefix;

  @override
  int get hashCode => unit.hashCode;
}
