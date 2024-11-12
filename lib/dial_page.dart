import 'package:contact_project/demo_page.dart';
import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  TextEditingController dialpadcontroller = TextEditingController();

  void moveTextCursorPosition() {
    dialpadcontroller.selection = TextSelection(
        baseOffset: dialpadcontroller.text.length,
        extentOffset: dialpadcontroller.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 350),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DemoPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white12,
            height: 635,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(textAlign: TextAlign.center,
                  controller: dialpadcontroller,
                  style: const TextStyle(color: Colors.white, fontSize: 45),
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}1';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}2';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "2",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}3';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}4';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "4",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}5';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "5",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}6';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "6",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}7';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "7",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}8';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "8",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}9';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "9",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        width: 100,
                        height: 70,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}*';
                            moveTextCursorPosition();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "*",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}0';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white10),
                          ),
                          onPressed: () {
                            dialpadcontroller.text =
                                '${dialpadcontroller.text}#';
                            moveTextCursorPosition();
                          },
                          child: const Text(
                            "#",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 180, bottom: 70),
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          fixedSize: MaterialStateProperty.all(
                            const Size.fromRadius(40),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.phone,
                            color: Colors.white, size: 50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, bottom: 60),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (dialpadcontroller.text.isNotEmpty) {
                              dialpadcontroller.text = dialpadcontroller.text
                                  .substring(
                                      0, dialpadcontroller.text.length - 1);
                            }
                          });
                          moveTextCursorPosition();
                        },
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
