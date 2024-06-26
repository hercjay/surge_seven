import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';


class MySecondaryButton extends StatelessWidget {
  final String label;
  final double? paddingWidth;
  final Function() onPressed;

  const MySecondaryButton({
    super.key,
    required this.label,
    this.paddingWidth,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // final screenUtil = ScreenUtil.instance;
    //final themeNotifier = Provider.of<ThemeNotifier>(context);
    
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingWidth ?? 0.0),
          child: Container(
            decoration: BoxDecoration(
              //color: setCardColor(context),
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                setSecBtnShadow(context),
              ],
            ),
            child: MaterialButton(
              onPressed: () {
                onPressed();
              },
              child: Text(
                label,
                style: TextStyle(
                  //color: themeNotifier.isDarkMode ? AppColors.primaryColorLighter : AppColors.primaryColorDark,
                  fontSize: buttonTextFont,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
