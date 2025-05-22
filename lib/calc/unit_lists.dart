import 'package:blackholecalculator/calc/astronomical_unit.dart';
import 'package:blackholecalculator/calc/earth_mass.dart';
import 'package:blackholecalculator/calc/light_year.dart';
import 'package:blackholecalculator/calc/planck_length.dart';
import 'package:blackholecalculator/calc/planck_mass.dart';
import 'package:blackholecalculator/calc/planck_time.dart';
import 'package:blackholecalculator/calc/solar_mass.dart';
import 'package:blackholecalculator/calc/years.dart';
import 'package:fling_units/fling_units.dart';

final List<Unit<Mass>> massUnitsList = [
  planckMasses,
  kilo.grams,
  tonnes,
  earthMasses,
  solarMasses,
];

final List<Unit<Distance>> distanceUnitsList = [
  planckLengths,
  nano.meters,
  meters,
  kilo.meters,
  miles,
  astronomicalUnits,
  lightYears,
];

final List<Unit<Time>> timeUnitsList = [
  planckTimes,
  seconds,
  minutes,
  hours,
  days,
  years,
];