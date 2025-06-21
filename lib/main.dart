import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('castar_sdk');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CastarSDK Demo')),
        body: Center(child: Text('Welcome to CastarSDK!')),
      ),
    );
  }
}
