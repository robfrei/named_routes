import 'package:flutter/material.dart';

import 'main.dart';

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({super.key});

  static const routeName = '/thirdPage';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ThirdPageArguments
    final args =
        ModalRoute.of(context)!.settings.arguments as ThirdPageArguments;

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
                String message = 'Returning from third page.';
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

class ThirdPageArguments {
  final String title;
  final String message;

  ThirdPageArguments(this.title, this.message);
}
