import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiUtils{
  static void showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(seconds: 3),
      ));
    });
  }
}