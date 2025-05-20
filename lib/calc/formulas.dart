

import 'package:fling_units/fling_units.dart';

final gravitationalConstant = 6.6743015e-11;
final speedOfLight = 299_792_458.0;
final schwarzschildConstant = 2 * gravitationalConstant / (speedOfLight * speedOfLight);

Measurement<Distance> schwarzschildRadiusFormula(
  Measurement<Mass> mass,
) {
  // Schwarzschild radius formula: R = 2Gm/c^2
  return (mass.butAs(kilo.grams).defaultValue * schwarzschildConstant).meters;
}