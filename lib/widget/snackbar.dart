import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

SnackBar createLoadingSnackBar() {
  return SnackBar(
    content: const Row(
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Text(
            'Loading...',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: MainColors.primary700,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    duration: const Duration(
      seconds: 2,
    ), // Keep the SnackBar visible for a longer duration
  );
}
