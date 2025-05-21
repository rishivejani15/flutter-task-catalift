import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static const TextStyle appBarTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle tabActive = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle tabInactive = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle rating = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle sectorTag = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle mentorName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle detailText = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle compatibility = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
  );
}
