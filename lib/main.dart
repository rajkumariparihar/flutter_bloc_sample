import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/demo_module/presentation/pages/home_page.dart';
import 'package:flutter_bloc_demo/utils/dio_api_client.dart';

setUpAll() async {
  DioApiClient _dioApiClient = DioApiClient();
  await initServiceLocator(_dioApiClient);
}

Future<void> main() async {
  await setUpAll();

  ///Setting up crash logger for logging fatal errors in application to log them in Sentry/Firebase analytics
  runZonedGuarded(() async {
    runApp(const MyApp());
  }, (object, trace) async {
    print(trace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
