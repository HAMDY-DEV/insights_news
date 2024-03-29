import 'package:flutter/material.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Source')),
    );
  }
}
