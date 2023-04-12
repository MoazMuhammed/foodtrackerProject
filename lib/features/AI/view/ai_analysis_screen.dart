
import 'dart:io';

import 'package:flutter/material.dart';

class AiAnalysisScreen extends StatefulWidget {
  const AiAnalysisScreen({Key? key, required this.file}) : super(key: key);
final File file;
  @override
  State<AiAnalysisScreen> createState() => _AiAnalysisScreenState();
}

class _AiAnalysisScreenState extends State<AiAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Image.file(widget.file),
    ));
  }
}
