import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/core/data/globals.dart';
import 'package:surge_seven/core/utils/connectivity_util/connectivity_provider.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/features/user/presentation/user_provider.dart';
import 'package:surge_seven/screens/initial_screens/splash_screen.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode

  FastCachedImageConfig.init();
  await setupDependencyInjection();

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<ThemeNotifier>(
        //   create: (_) => ThemeNotifier(),
        // ),
        ChangeNotifierProvider<ConnectivityProvider>(
          create: (_) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //HERCJAY EJIKE: create theme notifier item and use it with THEME widget
    //final themeNotifier = Provider.of<ThemeNotifier>(context);
    ScreenUtil.init(context);
    final globals = Globals.getInstance();

    return Theme(
      data: Theme.of(context),
      child: MaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        //set the theme dynamically
        //theme: themeNotifier.getTheme(),
        title: appName,
        home: const SafeArea(
          child: SplashScreen(),
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}

