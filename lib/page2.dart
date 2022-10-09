import 'package:flutter/material.dart';

import 'main.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key});

  static const routeName = '/secondPage';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as SecondPageArguments
    final args =
        ModalRoute.of(context)!.settings.arguments as SecondPageArguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30.0,
              child: Text(
                args.message,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String title = 'Page 1';
                String message = 'Returning from second page.';
                Navigator.pushNamed(
                  context,
                  MyFirstPage.routeName,
                  arguments: FirstPageArguments(
                    title,
                    message,
                  ),
                );
              },
              child: const Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPageArguments {
  final String title;
  final String message;

  SecondPageArguments(this.title, this.message);
}
