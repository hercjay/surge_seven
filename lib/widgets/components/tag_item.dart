import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';

class TagItem extends StatelessWidget {
  final Color? color;
  
  final String text;

  const TagItem({
    super.key,
    this.color,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? AppColors.primaryColorLight,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: smallTextStyle.copyWith(
          color: AppColors.textColorLight,
        ),
      ),
    );
  }
}