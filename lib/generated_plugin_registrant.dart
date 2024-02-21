import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(Registrar registrar) {
  ConnectivityPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
