import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> result =
        await Connectivity().checkConnectivity();
    return result != [ConnectivityResult.none];
  }
}
