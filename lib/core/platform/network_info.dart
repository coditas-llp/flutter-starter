import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkInfo {
  final _connectivity = Connectivity();

  Future<bool> get isConnected async {
    bool isDeviceOnline = true;
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isDeviceOnline = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isDeviceOnline = true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a wifi network.
      isDeviceOnline = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a wifi network.
      isDeviceOnline = false;
    }
    debugPrint("connectionStatus $isDeviceOnline");
    if (isDeviceOnline) {
      try {
        final result = await InternetAddress.lookup('www.example.com');
        isDeviceOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } catch (e) {
        debugPrint(e.toString());
        isDeviceOnline = false;
      }
    }
    return isDeviceOnline;
  }
}
