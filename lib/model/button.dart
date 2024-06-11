import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 100,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text , style: const TextStyle(fontSize: 20 , color: Colors.white),),
    );
  }
}