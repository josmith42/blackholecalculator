import 'package:fling_units/fling_units.dart';

// This class is used to wrap a unit and provide equality comparison for the DropdownMenu, as
// the default equality check does not work as expected for the Unit class.
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
