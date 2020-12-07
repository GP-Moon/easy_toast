import 'package:context_holder/context_holder.dart';
import 'package:handy_toast/handy_toast.dart';
import 'package:flutter/material.dart';

/// Created by GP
/// 2020/11/27.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// change toast default style
    Toast.defaultStyle = ToastStyle(
      color: Colors.green.withOpacity(0.8),
    );
    return MaterialApp(
      navigatorKey: ContextHolder.key,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy toast example app'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Toast at top'),
              onPressed: () => Toast.toast('Top toast', gravity: Gravity.top),
            ),
            TextButton(
              child: Text('Toast at center'),
              onPressed: () => Toast.toast('Center toast', gravity: Gravity.center, duration: Toast.LONG),
            ),
            TextButton(
              child: Text('Toast at bottom'),
              onPressed: () => Toast.toast('Bottom toast'),
            ),
            TextButton(
              child: Text('Widget toast'),
              onPressed: () => Toast.toast(
                Icon(
                  Icons.details,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              child: Text('Easy to use toast.'),
              onPressed: () => 'Just toast'.toast(),
            ),
          ],
        ),
      ),
    );
  }
}
