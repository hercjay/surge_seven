import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'connectivity_provider.dart';

class ConnectivityUtil {
  static Future<bool> hasConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<bool> hasData() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  static Future<bool> hasInternet() async {
    return await hasConnectivity() && await hasData();
  }
}

ConnectivityUtil connectivityUtil = ConnectivityUtil();

Widget showConnectivityStatus() {
  return Consumer<ConnectivityProvider>(
    builder: (context, connectivity, child) {
      if (connectivity.status == ConnectivityStatus.offline) {
        //dPrint("internet status changed: ${connectivity.status}");
        return const SizedBox(); //OfflineWarningWidget();
      } else {
        //dPrint("internet status changed: ${connectivity.status}");
        return const SizedBox();
      }
    },
  );
}
