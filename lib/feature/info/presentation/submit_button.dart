import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.isEnabled,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEnabled
              ? [Colors.cyan, Colors.lightBlue]
              : [Colors.grey, Colors.grey],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
      width: double.infinity,
      height: 50,
      child: TextButton(
        key: const ValueKey('main_button'),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          'Submit',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
