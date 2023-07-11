import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionCheckerPlus internetConnectionCheckerPlus;

  NetworkInfoImpl(this.internetConnectionCheckerPlus);

  @override
  Future<bool> get isConnected => internetConnectionCheckerPlus.hasConnection;

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged;
}
