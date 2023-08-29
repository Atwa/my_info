import 'package:flutter/material.dart';

class InfoFormScreen extends StatefulWidget {
  const InfoFormScreen({super.key});

  @override
  State<InfoFormScreen> createState() => _InfoFormScreenState();
}

class _InfoFormScreenState extends State<InfoFormScreen> {
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
