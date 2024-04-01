import 'package:flutter/material.dart';

showErrorDialogs({context, text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
