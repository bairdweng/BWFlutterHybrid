// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../tools/mychannel.dart';

class CallMethodsPage extends StatefulWidget {
  const CallMethodsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CallMethodsPage> createState() => _CallMethodsPageState();
}

class _CallMethodsPageState extends State<CallMethodsPage> {
  int _counter = 0;

  String _hello = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    MyChannel.back();
  }

  void _initChannel() async {
    const channel = MethodChannel("flutterCallMethodChannel");
    Future<dynamic> invokedMethods(MethodCall methodCall) async {
      print("method=====${methodCall.method}");
      setState(() {
        _hello = methodCall.method;
      });
    }

    channel.setMethodCallHandler(invokedMethods);
  }

  @override
  Widget build(BuildContext context) {
    _initChannel();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the CallMethodsPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_hello),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '看到没有，我是方法调用界面',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
