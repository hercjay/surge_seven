import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';

class GreenCard extends StatelessWidget {
  const GreenCard({
    super.key,
    required this.height,
    required this.child,
  });

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor, //AppColors.primaryColorLighter,
            AppColors.primaryColor,
          ],
        ),
      ),
      child: child,
      );
  }
}