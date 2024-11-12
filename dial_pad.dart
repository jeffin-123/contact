import 'package:flutter/material.dart';


class DialPad extends StatefulWidget{
  const DialPad({super.key, required bool enableDtmf, required bool hideSubtitle, required MaterialColor backspaceButtonIconColor, required Color buttonTextColor, required Color dialOutputTextColor, required Null Function(dynamic value) keyPressed, required Null Function(dynamic number) makeCall});

  @override
  State<DialPad> createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
