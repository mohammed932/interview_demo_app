import 'package:flutter/material.dart';
import 'package:interview_test/features/Test/test.dart';
import 'package:interview_test/features/products/presentation/screens/products/products.imports.dart';
import 'package:interview_test/injection.dart';
import 'package:valu_network_layer/valu_network_layer.dart';

import 'core/constants/network_keys.dart';
import 'core/network/interceptors/interceptors.imports.dart';
import 'core/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  NetworkConfig(
    local: 'en',
    isDebugMode: true,
    jwtImageAPIKey: NetworkKeys.jwtImageAPIKey(),
    domains: Utils.getDomains(),
    interceptors: InterceptorUtils.getInterceptors(),
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
