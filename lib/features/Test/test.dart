import 'package:flutter/material.dart';
import 'package:interview_test/core/constants/static_data.dart';
import 'package:valu_network_layer/valu_network_layer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  callApi() async {
    try {
      NetworkConfig.changeLocal(local: 'ar');
      var queryParameters = {
        'q': 'e',
      };
      final Map<String, dynamic> response =
          await RemoteServiceInjector().remoteService(
        url: ValuStaticDataEndpoints.getEmployers(queryParameters),
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  sendOtp() async {
    // try {
    //   Map<String, dynamic> body = {
    //     'custLang': "EN",
    //     'mobileNumber': "01068568498",
    //     'refNumber': "890771",
    //     'aggregatorId': "MobApp",
    //     "reqSecureKey": "Ej1sqlRHvvmfZrhGJY+Whg=="
    //   };
    //   Map<String, dynamic> response =
    //       await RemoteServiceInjector().remoteService(
    //     url: ValuStaticDataEndpoints.sendOtp(body),
    //   );
    //   print(response);
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Network Layer"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => callApi(),
          child: const Text("Ok"),
        ),
      ),
    );
  }
}

// make static function for changing local instead of copywith ==> Done
// make baseInterceptor in network layer  ==> Done
// separate collections abstract in network package and implemetn in based app