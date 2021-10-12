import 'package:flutter/material.dart';

import './pages/home.dart';
import './pages/setting.dart';
import './pages/callmethods.dart';

void main() =>
    runApp(const MYViewContainer(rootPage: HomePage(title: "title")));

// 这里对应native传递过来的参数
@pragma('vm:entry-point')
void nativeHome() =>
    runApp(const MYViewContainer(rootPage: HomePage(title: "title")));

@pragma('vm:entry-point')
void nativeSetting() =>
    runApp(const MYViewContainer(rootPage: SettingPage(title: "title")));

@pragma('vm:entry-point')
void nativeCallMethods() =>
    runApp(const MYViewContainer(rootPage: CallMethodsPage(title: "title")));

class MYViewContainer extends StatelessWidget {
  final Widget? rootPage;
  const MYViewContainer({Key? key, required this.rootPage}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: rootPage,
    );
  }
}
