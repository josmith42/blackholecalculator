
import 'package:fling_units/fling_units.dart';

enum UnitLabel {
    meters(label: 'm'),
    kilometers(label: 'km'),
    lightYears(label: 'ly');


  final String label;

  const UnitLabel({required this.label});
}