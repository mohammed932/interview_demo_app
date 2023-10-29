import 'package:flutter/material.dart';
import 'package:interview_test/features/Test/test.dart';
import 'package:interview_test/features/products/presentation/screens/products/products.imports.dart';
import 'package:interview_test/injection.dart';
import 'package:valu_network_layer/valu_network_layer.dart';

import 'core/constants/network_keys.dart';
import 'core/network/interceptors/interceptors.imports.dart';
import 'core/security/security_settings.dart';
import 'core/utils/utils.dart';

void main() async {
  const env = Environment.DEV;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  NetworkConfig(
    local: 'en',
    isDebugMode: true,
    isLogEnabled: true,
    jwtImageAPIKey: NetworkKeys.jwtImageAPIKey(),
    domains: Utils.getDomains(),
    interceptors: [
      AppInterceptor(),
      UnauthorizedInterceptor(),
      InternetConnectivityInterceptor()
    ],
    sslPinning: SSLPinning(
      isEnabled: env == Environment.PROD,
      sslFingerprint: NetworkKeys.sslFingerprint,
    ),
    proxy: Proxy(
      isEnabled: env != Environment.PROD,
      proxy: SecuritySettingsConfig.instatnce.proxyConfigurations.proxy,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestScreen(),
    );
  }
}
