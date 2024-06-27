import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:surge_seven/config/app_colors.dart';

//storyset icons

double maxImgWidth = 50000;

double screenPaddingW = 20;
double screenPaddingH = 15;
double btnPaddingWidth = 25;

EdgeInsetsGeometry screenPadding =
    EdgeInsets.symmetric(horizontal: screenPaddingW);
EdgeInsetsGeometry screenPadding2 = EdgeInsets.only(
    left: screenPaddingW, right: screenPaddingW, top: screenPaddingH);

//fonts
double largeFont = 50;
double largeFont2 = 40;
double largeFont3 = 32;
double landingFontSize = 25;
double buttonTextFont = 18.0;
double courseCardTitle = 17.0;
double landingFontSize2 = 15;
double smallFont = 12;

//Text Styles
TextStyle titleTextStyle = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
  //color: primaryColor,
);
TextStyle mediumTextStyle = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w300,
  //color: primaryColor,
);


TextStyle smallTextStyle = const TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w300,
  //color: primaryColor,
);

TextStyle cardTitleStyle = const TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
  //color: primaryColor,
);

TextStyle itemNameStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

TextStyle formLabelStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

Color setTitleColor(context) {
  Color c = Theme.of(context).brightness == Brightness.dark
      ? Colors.white.withOpacity(0.8)
      : Colors.black;
  return c;
}

Color setCardColor(context) {
  Color c = Theme.of(context).brightness == Brightness.dark
      ? Color.fromARGB(255, 11, 41, 56)
      : Color.fromARGB(255, 241, 241, 241); //Color.fromARGB(255, 236, 236, 236)
  return c;
}

Color setCardShadowColor(context) {
  Color c = Theme.of(context).brightness == Brightness.dark
      ? Color.fromARGB(255, 11, 41, 56)
      : Colors.grey.withOpacity(0.32);
  return c;
}

BoxShadow setBtnShadow(BuildContext context) {
  BoxShadow light = BoxShadow(
    color: AppColors.textColorDark.withOpacity(0.3),
    blurRadius: 25,
    offset: const Offset(0, 15),
  );

  BoxShadow dark = const BoxShadow(
    color: AppColors.primaryColorDark,
    blurRadius: 0,
    blurStyle: BlurStyle.solid,
    offset: Offset(0, 5),
  );

  return Theme.of(context).brightness == Brightness.dark ? dark : light;
}

BoxShadow setSecBtnShadow(BuildContext context) {
  BoxShadow light = const BoxShadow(
    color: AppColors.primaryColor,
    blurRadius: 0,
    blurStyle: BlurStyle.solid,
    offset: Offset(0, 5),
  );

  BoxShadow dark = const BoxShadow(
    color: AppColors.primaryColorLight,
    blurRadius: 0,
    blurStyle: BlurStyle.solid,
    offset: Offset(0, 5),
  );

  return Theme.of(context).brightness == Brightness.dark ? dark : light;
}

//network
const int netWorkRequestTimeOut = 20;
const int netWorkRequestInfoTimeOut = 10;
Duration internetRequiredAlertDuration = const Duration(seconds: 15);
Duration importantInternetAlertDuration = const Duration(seconds: 15);
Duration midInternetAlertDuration = const Duration(seconds: 6);
Duration toastDuration = const Duration(seconds: 3);
Duration otherInternetErrorAlertDuration = const Duration(minutes: 1);

void showToast(String message, [EasyLoadingToastPosition? position]) {
  position ??= EasyLoadingToastPosition.top;
  if (EasyLoading.isShow) EasyLoading.dismiss();
  EasyLoading.showToast(message,
      toastPosition: position, duration: toastDuration);
}

void showError(String message, [Duration? duration]) {
  if (EasyLoading.isShow) EasyLoading.dismiss();
  EasyLoading.showError(message, duration: duration ?? toastDuration);
}

void showSuccess(String message, [Duration? duration, bool? dismiss]) {
  if (EasyLoading.isShow) EasyLoading.dismiss();
  EasyLoading.showSuccess(message,
      duration: duration ?? toastDuration, dismissOnTap: dismiss ?? false);
}

void showInfo(String message, [Duration? duration]) {
  if (EasyLoading.isShow) EasyLoading.dismiss();
  EasyLoading.showInfo(message, duration: duration ?? toastDuration);
}

void showProgress(String message) {
  if (EasyLoading.isShow) EasyLoading.dismiss();
  EasyLoading.show(status: message);
}

void dPrint(String message) {
  if (kDebugMode) {
    print(message);
  }
}

void hercNavigationPush(BuildContext context, Widget nextScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}

void hercNavigationPushAndReplace(BuildContext context, Widget nextScreen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => nextScreen));
}

void hercNavigationPushAndReplaceAllBefore(
    BuildContext context, Widget nextScreen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => nextScreen), (route) => false);
}

// Consumer<ThemeNotifier> themeSwitcher() {
//   return Consumer<ThemeNotifier>(
//     builder: (context, notifier, child) => Switch(
//       value: notifier.isDarkMode,
//       onChanged: (value) async {
//         notifier.toggleTheme();
//       },
//       activeTrackColor: Colors.grey,
//       activeColor: Colors.white,
//     ),
//   );
// }

//APP Names
const appName = 'Surge Seven';
const companyName = 'Hercjay Studios';

//user preferences stored on phone

bool isDarkMode = false;

//SharedPreferences prefs = await SharedPreferences.getInstance();
// bool boolValue = _prefs.getBool('option');

// Future<bool> getThemeAndSetTheBoolean() async {
//   final prefs = await SharedPreferences.getInstance();

//   //check if preferred theme already exists (null if it does not, create one)
//   if (prefs.getBool('isUserDarkMode') == null) {
//     await prefs.setBool('isUserDarkMode', false);
//     isDarkMode = false;
//   } else {
//     bool? isUserDarkMode = prefs.getBool('isUserDarkMode');

//     /// set theme mode according to preferred value
//     if (isUserDarkMode == true) {
//       isDarkMode = true;
//     } else {
//       isDarkMode = false;
//     }
//   }
//   return isDarkMode;
// }


// void handleNetworkTimeOut() {
//   // Use Future.delayed to trigger a toast after a specific amount of time
//   Future.delayed(const Duration(seconds: netWorkRequestTimeOut), () {
//     EasyLoading.showInfo('time_out_error'.tr(),
//         dismissOnTap: true,
//         duration: const Duration(seconds: netWorkRequestInfoTimeOut));
//   });
// }
