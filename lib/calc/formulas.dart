

import 'package:fling_units/fling_units.dart';

const gravitationalConstant = 6.6743015e-11; // m^3*/(kg*s^2) - https://en.wikipedia.org/wiki/Gravitational_constant
const speedOfLight = 299_792_458.0; // m/s - https://en.wikipedia.org/wiki/Speed_of_light
const schwarzschildConstant = 2 * gravitationalConstant / (speedOfLight * speedOfLight);

Measurement<Distance> schwarzschildRadiusFormula(
  Measurement<Mass> mass,
) {
  // Schwarzschild radius formula: R = 2Gm/c^2
  // https://en.wikipedia.org/wiki/Schwarzschild_radius
  return (mass.butAs(kilo.grams).defaultValue * schwarzschildConstant).meters;
}