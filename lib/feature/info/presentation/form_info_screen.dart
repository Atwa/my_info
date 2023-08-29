import 'package:flutter/material.dart';

class FormInfoScreen extends StatefulWidget {
  const FormInfoScreen({super.key});

  @override
  State<FormInfoScreen> createState() => _FormInfoScreenState();
}

class _FormInfoScreenState extends State<FormInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Title'),
        ),
        body: const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                'Hello World',
              )
            ])));
  }
}
