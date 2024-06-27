import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/utils/screen_util.dart';

class StandardScreen extends StatefulWidget {
  const StandardScreen({super.key, required this.child, required this.title});
  final Widget child;
  final Widget title;
  @override
  State<StandardScreen> createState() => _StandardScreenState();
}

class _StandardScreenState extends State<StandardScreen> {
  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgrounColorLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.textColorDark.withOpacity(0.05),
          title: widget.title,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding2,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
