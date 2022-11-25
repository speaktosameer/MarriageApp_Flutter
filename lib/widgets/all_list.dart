import 'package:flutter/cupertino.dart';
import 'package:marriage/register/kundali_info.dart';
class AllList{
  final List<double> height = [
    4,
    4.1,
    4.2,
    4.3,
    4.4,
    4.5,
    4.6,
    4.7,
    4.8,
    4.9,
    4.10,
    4.11,
    5,
    5.1,
    5.2,
    5.3,
    5.4,
    5.5,
    5.6,
    5.7,
    5.8,
    5.9,
    5.10,
    5.11,
    6,
    6.1,
    6.2,
    6.3,
    6.4,
    6.5,
    6.6,
    6.7,
    6.8,
    6.9,
    6.10,
    6.11,
    7
  ];
  List<Widget> section = [
    const SizedBox(),
    sections(),
    sections2(),
    sections3(),
    sections4(),
  ];
  List<Widget> gsection = [
    const SizedBox(),
    Gsections(),
    Gsections2(),
    Gsections3(),
    Gsections4(),
  ];

  final List<String> studied = [
    'No degree',
    'School level',
    '+2',
    'Foundation',
    'Diploma',
    'Bachelors',
    'Masters',
    'PHD'
  ];
  final List<String> college = [
    'Tribhuwan University',
    'Kathmandu University',
    'Pokhara University',
    'Purvanchal University'
  ];
  final List<String> religion = [
    'Buddhist',
    'Christian',
    'Muslim',
    'Hinduism',
  ];
  final List<String> yesno = ['Yes', 'No'];
  final List<String> genderItems = [
    'Singing',
    'Dancing',
    'Acting',
    'Painting',
  ];
  final List<int> weight = [
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80
  ];

  String? timetocallvalue;
  final List<String> callItems = [
    'Morning',
    'Evening',
    'Afternoon',
    'Night',
  ];
  final List<String> bloodgrp = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

}