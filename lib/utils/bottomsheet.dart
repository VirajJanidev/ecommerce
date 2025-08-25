import 'package:flutter/material.dart';

class Bottomsheet{
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column();
      },
    );
  }
}