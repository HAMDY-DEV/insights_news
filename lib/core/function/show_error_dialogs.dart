import 'package:flutter/material.dart';

void showErrorDialogs({context, text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
