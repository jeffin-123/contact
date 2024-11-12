import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dial_pad.dart';


class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:
          DialPad(
              enableDtmf: true,
              //outputMask: "(000) 000-0000",
              hideSubtitle: false,
              backspaceButtonIconColor: Colors.red,
              buttonTextColor: Colors.white,
              dialOutputTextColor: Colors.white,
              keyPressed: (value){
                if (kDebugMode) {
                  print('$value was pressed');
                }
              },
              makeCall: (number){
                if (kDebugMode) {
                  print(number);
                }
              }
          )
      ),
    );
  }
}
