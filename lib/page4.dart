import 'package:flutter/material.dart';

import 'main.dart';

class MyFourthPage extends StatelessWidget {
  const MyFourthPage({super.key});

  static const routeName = '/fourthPage';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as FourthPageArguments
    final args =
        ModalRoute.of(context)!.settings.arguments as FourthPageArguments;

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
              child: Text('Boolean Value: ${args.status}',
                  style: const TextStyle(fontSize: 20.0)),
            ),
            ElevatedButton(
              onPressed: () {
                String title = 'Page 1';
                String message = 'Returning from fourth page.';
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

class FourthPageArguments {
  final String title;
  final bool status;

  FourthPageArguments(this.title, this.status);
}
