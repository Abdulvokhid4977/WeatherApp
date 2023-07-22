import 'package:connectivity_plus/connectivity_plus.dart';
class CacheKeys{
  static List<ConnectivityResult> internet = [
    ConnectivityResult.mobile,
    ConnectivityResult.wifi,
    ConnectivityResult.vpn,
  ];
  static Future<bool> hasInternet() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return CacheKeys.internet.contains(result);
  }
}