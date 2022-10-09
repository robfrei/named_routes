import 'package:flutter/material.dart';

import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home: const MyFirstPage(title: 'Named Routes'),
      //initialRoute: '/',
      routes: {
        // register the page widgets in the routes table
        MyFirstPage.routeName: (context) => const MyFirstPage(),
        MySecondPage.routeName: (context) => const MySecondPage(),
        MyThirdPage.routeName: (context) => const MyThirdPage(),
        MyFourthPage.routeName: (context) => const MyFourthPage(),
        MyFifthPage.routeName: (context) => const MyFifthPage(),
      },
    );
  }
}

class MyFirstPage extends StatefulWidget {
  static const routeName = '/';

  const MyFirstPage({super.key});

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    String title;
    String message;
    final args =
        ModalRoute.of(context)!.settings.arguments as FirstPageArguments?;
    // handle the case where title and message are initially null due to
    // ModalRoute not yet being called (make FirstPageArguments nullable above)
    // NOTE: this only affects MyFirstPage().
    if (args == null) {
      title = 'Page 1';
      message = '';
    } else {
      title = args.title;
      message = args.message;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8.0),
              child: const Text(
                'Flutter Named Routes',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            //
            // PAGE 2 BUTTON - navigate to page 2 widget
            //
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String title = 'Page 2';
                  String message = 'Welcome to Page 2';
                  Navigator.pushNamed(
                    context,
                    MySecondPage.routeName,
                    arguments: SecondPageArguments(
                      title,
                      message,
                    ),
                  );
                },
                child: const Text('Page 2'),
              ),
            ),
            //
            // PAGE 3 BUTTON - navigate to page 3 widget
            //
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String title = 'Page 3';
                  String message = 'Welcome to Page 3';
                  Navigator.pushNamed(
                    context,
                    MyThirdPage.routeName,
                    arguments: ThirdPageArguments(
                      title,
                      message,
                    ),
                  );
                },
                child: const Text('Page 3'),
              ),
            ),
            //
            // PAGE 4 BUTOON - navigate to page 4 widget
            //
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String title = 'Page 4';
                  bool status = true;
                  Navigator.pushNamed(
                    context,
                    MyFourthPage.routeName,
                    arguments: FourthPageArguments(title, status),
                  );
                },
                child: const Text('Page 4'),
              ),
            ),
            //
            // PAGE 5 BUTOON - navigate to page 5 widget
            //
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String title = 'Page 5';
                  String message = 'Welcome to Page 5';
                  Navigator.pushNamed(
                    context,
                    MyFifthPage.routeName,
                    arguments: FifthPageArguments(title, message),
                  );
                },
                child: const Text('Page 5'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FirstPageArguments {
  final String title;
  final String message;

  FirstPageArguments(this.title, this.message);
}
