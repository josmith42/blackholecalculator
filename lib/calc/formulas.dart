

import 'package:fling_units/fling_units.dart';

final gravitationalConstant = 6.67430e-11;
final speedOfLight = 299792458.0;
final schwarzschildConstant = 2 * gravitationalConstant / (speedOfLight * speedOfLight);

Measurement<Distance> schwarzschildRadiusFormula(
  Measurement<Mass> mass,
) {
  // Schwarzschild radius formula: R = 2Gm/c^2
  return (mass.butAs(kilo.grams).defaultValue * schwarzschildConstant).meters;
}