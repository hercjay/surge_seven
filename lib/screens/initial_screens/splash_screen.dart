import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/core/error/error_keys.dart';
import 'package:surge_seven/features/user/domain/use_cases/get_local_user_use_case.dart';
import 'package:surge_seven/features/user/presentation/user_provider.dart';
import 'package:surge_seven/screens/admin_screens/admin_home_screen.dart';
import 'package:surge_seven/screens/client_screens/client_home_screen.dart';
import 'package:surge_seven/screens/initial_screens/signup_screen.dart';
import 'package:surge_seven/screens/truck_owner_screens/truck_owner_homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      //show splash for at least two seconds
      _handleNavigation(context);
    });

    super.initState();
  }

  int remoteRetries = 0;

  void _handleNavigation(BuildContext context) async {
    final getlocalUserUseCase = getIt<GetLocalUserUseCase>();
    final userProvider = getIt<UserProvider>();
    final currentUserEntityEither = await getlocalUserUseCase.call();
    
    currentUserEntityEither.fold(
      (error) {
      //showError(error.message, otherInternetErrorAlertDuration);
      Future.delayed(const Duration(seconds: 3), () {
        hercNavigationPushAndReplace(context, const SignupScreen());
      });
    }, (user) {
      dPrint("User logged from local data success SPLASH SCREEN as $user");
      userProvider.setCurrentUser(user);
      switch (user.userType) {
        case UserTypes.Admin:
          hercNavigationPushAndReplace(context, const AdminHomeScreen());
          break;
        case UserTypes.TruckOwner:
          hercNavigationPushAndReplace(context, const TruckOwnerHomeScreen());
          break;
        default:
          hercNavigationPushAndReplace(context, const ClientHomeScreen());
      }
    });

    //await Authentication.initializeFirebase(context: context);

    //temp bug fix: force set theme
    // final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    // themeNotifier.toggleTheme();
    // themeNotifier.toggleTheme();

    // currentUserEntityEither.fold((error) {
    //   switch (error.message) {
    //     case ErrorKeys.REFUSED:
    //       //EasyLoading.showError('error_connecting_to_server'.tr());
    //       _retry();
    //       break;
    //     case ErrorKeys.REMOTE_DB_LATE_INITIALIZATION:
    //       //EasyLoading.showError('error_connecting_to_server'.tr());
    //       _retry();
    //       break;
    //     case ErrorKeys.USER_NOT_FOUND:
    //       // normally should not happen
    //       EasyLoading.dismiss();
    //       //hercNavigationPushAndReplace(context, const LandingPage());
    //       break;
    //     case ErrorKeys.USER_NOT_IN_LOCAL_DB:
    //       //hercNavigationPushAndReplace(context, const LandingPage());
    //       break;
    //     case ErrorKeys.FIREBASE_LOGIN_FAILED:
    //       //user is NOT signed in with google
    //       //hercNavigationPushAndReplace(context, const LandingPage());
    //       break;
    //     case ErrorKeys.TIMEOUT:
    //       // EasyLoading.showError('time_out_error'.tr(),
    //       //     duration: importantInternetAlertDuration);
    //       _handleNavigation(context); //retry
    //       break;
    //     case ErrorKeys.CLOSED_BEFORE_FULL_HEADER:
    //       // EasyLoading.showError('poor_internet_error'.tr(),
    //       //     duration: importantInternetAlertDuration);
    //       _handleNavigation(context); //retry
    //       break;
    //     case ErrorKeys.MYSQL_CONNECTION_FAILED:
    //       //showError('remote_connection_failed'.tr());
    //       _retry();
    //       break;
    //     case ErrorKeys.REMOTE_DB_DETAILS_MISSING:
    //       _proceedWithLocal();
    //       break;
    //     case ErrorKeys.ERROR_OPENING_REMOTE_DB:
    //       //showError('remote_connection_failed'.tr());
    //       _proceedWithLocal();
    //       break;
    //     default:
    //       dPrint('i am on the last, DEFAULT');
    //       EasyLoading.showError(error.message,
    //           duration: otherInternetErrorAlertDuration);
    //   }
    // }, (currentUserEntity) {
    //   dPrint("User logged in success SPLASH SCREEN as $currentUserEntity");

    //   EasyLoading.dismiss();

    //   // hercNavigationPushAndReplace(
    //   //     context, HomeScreen(user: currentUserEntity));
    // });


  }

  void _retry() {
    if (remoteRetries < 3) {
      remoteRetries++;
      showInfo('Retrying...', importantInternetAlertDuration);
      _handleNavigation(context); //retry
    } else {
      _proceedWithLocal();
      // EasyLoading.showInfo('off_internet_try_local'.tr(),
      //     duration: importantInternetAlertDuration);
    }
  }

  void _proceedWithLocal() async {
    //showProgress('searching_local_user_data'.tr());
    //get the id of current Firebase user
    // final currentUserEntity = await Authentication.getLocalUser();
    // currentUserEntity.fold((error) {
    //   showError(
    //       'error_getting_local_user_data'.tr(), importantInternetAlertDuration);
    //   //wait for 3 seconds and call retry
    //   remoteRetries = 0;
    //   Timer(const Duration(seconds: 3), () {
    //     _retry();
    //   });
    // }, (currentUserEntity) {
    //   //showSuccess('local_login_success'.tr(), midInternetAlertDuration, true);
    //   UserProvider userProvider =
    //       Provider.of<UserProvider>(context, listen: false);
    //   userProvider.setCurrentUser(currentUserEntity);
    //   hercNavigationPushAndReplace(
    //       context, HomeScreen(user: currentUserEntity));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.scaffoldBackgrounColorDark,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Transform.translate(
          offset: const Offset(0, -50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, 25),
                child: Image.asset('assets/images/png/surge-seven1.png',
                    height: 120),
              ),
              const Text(appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              const SizedBox(height: 8),
              const SizedBox(
                width: 120, //MediaQuery.of(context).size.width * 0.5,
                height: 3,
                child: const LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColorLight),
                ),
              ),
            ],
          ), // Replace with your image
        ),
      ),
    );
  }
}
