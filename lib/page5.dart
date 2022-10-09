import 'package:flutter/material.dart';

import 'main.dart';

class MyFifthPage extends StatelessWidget {
  const MyFifthPage({super.key});

  static const routeName = '/fifthPage';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as FifthPageArguments
    final args =
        ModalRoute.of(context)!.settings.arguments as FifthPageArguments;
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
                String message = 'Returning from fifth page.';
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

class FifthPageArguments {
  final String title;
  final String message;

  FifthPageArguments(this.title, this.message);
}
