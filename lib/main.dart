import 'package:currency_converter_app/scrrens/ConverterPage.dart';
import 'package:currency_converter_app/scrrens/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
   GetMaterialApp(
    theme: ThemeData(useMaterial3: true),
    darkTheme: ThemeData.dark(useMaterial3: true),
    debugShowCheckedModeBanner: false,
     // home: CurrencyPage(),
      routes: {
        '/':(context) => ExamplePage(),
        'home':(context) => CurrencyConverter(),
      },
    )
  );
}
