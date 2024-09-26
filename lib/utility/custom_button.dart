
import 'package:flutter/material.dart';

class custom_button extends StatefulWidget {
  const custom_button({super.key});

  @override
  State<custom_button> createState() => _custom_buttonState();
}

class _custom_buttonState extends State<custom_button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(''));
  }
}
