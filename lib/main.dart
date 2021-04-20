import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blutton',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Blutton'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int random = 0;
  bool widgetVisible = false ;
  var url = '';

  switchcase() {
    switch (random) {
      case 1:
        return url = 'https://www.youtube.com/watch?v=9hhMUT2U2L4';
      case 2:
        return url = 'https://www.youtube.com/watch?v=4j9xw-D38cE';
      case 3:
        return url = 'https://www.youtube.com/watch?v=CJDukS4s_LA';
      case 4:
        return url = 'https://www.youtube.com/watch?v=_mCUE6iwCQo';
      case 5:
        return url = 'https://www.youtube.com/watch?v=S0yLbdZRu3A';
      case 6:
        return url = 'https://www.youtube.com/watch?v=OxcfZ5OP5cE';
      case 7:
        return url = 'https://www.youtube.com/watch?v=exdtKETbxp8';
      case 8:
        return url = 'https://www.youtube.com/watch?v=_6Y_j0OA_BQ';
      case 9:
        return url = 'https://www.youtube.com/watch?v=rLbgR6Y47Is';
      case 10:
        return url = 'https://www.youtube.com/watch?v=UqMbX9e83sY';
      case 0:
        return url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
    }
  }

  void showWidget(){
    setState(() {
      widgetVisible = true ;
    });
  }

  void _routesPush(){
    setState(() {
      widgetVisible = false;
    });

    switchcase();

    print(url);
    _launchURL() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchURL();
  }

  void _generateRandonNumber(){
    var _random = new Random();
    random = _random.nextInt(10);
    print(random);
    showWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _generateRandonNumber(),
              child: Text("Aperta ae"),
              color: Colors.black,
              textColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.deepPurple)
              )
            ),
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: widgetVisible,
                child: ElevatedButton(
                  onPressed: () => _routesPush(),
                  child: Text('Press this button, to me see something'),)
            ),
          ],
        ),
      ),
    );
  }
}