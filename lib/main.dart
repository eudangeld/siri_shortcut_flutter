import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'second': (context) => SiriRoute(),
      },
      title: 'Flutter with siri and UIVIEW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('dan.flutter.intent/siri');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("Donate shortcut"),
            onPressed: () => donateShortcut(),
          ),
          FlatButton(
            child: Text("Goto siri route"),
            onPressed: () => Navigator.of(context).pushNamed('second'),
          )
        ],
      )),
    );
  }

  Future<void> donateShortcut() async {
    platform.invokeMethod('donateShortCut');
  }
}

class SiriRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
          SizedBox(
              width: 10,
              height: 10,
              child: UiKitView(
                viewType: "SiriButton",
              )),
        ],
      ),
    );
  }
}
