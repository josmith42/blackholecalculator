import 'dart:math';

import 'package:fling_units/fling_units.dart';

const gravitationalConstant =
    6.6743015e-11; // m^3*/(kg*s^2) - https://en.wikipedia.org/wiki/Gravitational_constant
const speedOfLight =
    299_792_458.0; // m/s - https://en.wikipedia.org/wiki/Speed_of_light
const hBar =
    1.0545718e-34; // J*s - https://en.wikipedia.org/wiki/Planck_constant

const schwarzschildConstant =
    2 * gravitationalConstant / (speedOfLight * speedOfLight);
const lifetimeConstant =
    5120.0 *
    pi *
    gravitationalConstant *
    gravitationalConstant /
    (1.8083 * hBar * speedOfLight * speedOfLight * speedOfLight * speedOfLight);

Measurement<Distance> schwarzschildRadiusFromMass(Measurement<Mass> mass) {
  // Schwarzschild radius formula: R = 2Gm/c^2
  // https://en.wikipedia.org/wiki/Schwarzschild_radius
  return (mass.butAs(kilo.grams).defaultValue * schwarzschildConstant).meters;
}

Measurement<Mass> massFromSchwarzschildRadius(Measurement<Distance> radius) {
  // Rearranging the Schwarzschild radius formula to find mass: m = Rc^2/(2G)
  // https://en.wikipedia.org/wiki/Schwarzschild_radius
  return (radius.butAs(meters).defaultValue / schwarzschildConstant).kilo.grams;
}

Measurement<Time> lifetimeFromMass(Measurement<Mass> mass) {
  // Lifetime formula: t = 5120πG^2m^3/(ħc^4)
  // https://en.wikipedia.org/wiki/Black_hole#Hawking_radiation
  return (pow(mass.butAs(kilo.grams).defaultValue, 3) * lifetimeConstant).seconds;
}

Measurement<Mass> massFromLifetime(Measurement<Time> lifetime) {
  // Rearranging the lifetime formula to find mass: m = (ħc^4t/(5120πG^2))^(1/3)
  // https://en.wikipedia.org/wiki/Black_hole#Hawking_radiation
  return (pow(lifetime.butAs(seconds).defaultValue / lifetimeConstant, 1 / 3))
      .kilo.grams;
}