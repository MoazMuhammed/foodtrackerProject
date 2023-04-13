import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/AI/widget/ai_analysis_container_widget.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_details.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_movment.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_warning.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AiAnalysisScreen extends StatefulWidget {
  const AiAnalysisScreen({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  State<AiAnalysisScreen> createState() => _AiAnalysisScreenState();
}

class _AiAnalysisScreenState extends State<AiAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.file(widget.file,
                  height: 35.h, width: double.infinity, fit: BoxFit.fill),
              Container(
                decoration: BoxDecoration(color: Colors.white60),
                child: ForgetPasswordBarWidget(
                    onPressed: () => pop(context), title: "FA Scanner"),
              ),
            ],
          ),
          AIAnalysisContainerWidget()        ],
      ),
    ));
  }
}
