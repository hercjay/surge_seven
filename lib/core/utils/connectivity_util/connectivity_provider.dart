import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:surge_seven/core/utils/connectivity_util/connectivity_util.dart';

enum ConnectivityStatus { online, offline }

ConnectivityUtil connectivityUtil = ConnectivityUtil();

class ConnectivityProvider extends ChangeNotifier {
  ConnectivityStatus _status = ConnectivityStatus.online;

  ConnectivityStatus get status => _status;

  ConnectivityProvider() {
    Connectivity().onConnectivityChanged.listen((status) {
      _status = status == ConnectivityResult.none
          ? ConnectivityStatus.offline
          : ConnectivityStatus.online;
      notifyListeners();
    });
  }
}
