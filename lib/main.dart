import 'package:contacts_app/pages/contacts.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
      //MyApp(),
      //MyApp(),
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: false, // Set to true
      locale: DevicePreview.locale(context),
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: ContactHomeView(),
    );
  }
}
