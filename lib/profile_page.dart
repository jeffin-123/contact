//import 'dart:js_interop_unsafe';

import 'package:contact_project/demo_page.dart';
import 'package:contact_project/edit_page.dart';
import 'package:contact_project/hive/hive.dart';

import 'package:flutter/material.dart';

import 'main.dart';

class ProfilePage extends StatefulWidget {
  final List<dynamic>? contactList;
  final int index;

  const ProfilePage({
    super.key,
    this.contactList,
    required this.index,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        leading: IconButton(
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
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                      contactList: widget.contactList, index: widget.index),
                ),
              );
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: widget.contactList![widget.index].isFavorite
                ? const Icon(
                    Icons.star_border_outlined,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
            onPressed: () {
              setState(() {
                if (widget.contactList?[widget.index].isFavorite == false) {
                  widget.contactList?[widget.index].isFavorite = true;
                  box?.putAt(
                    widget.index,
                    HiveContact(
                        givenName: widget.contactList?[widget.index].givenName,
                        familyName:
                            widget.contactList?[widget.index].familyName,
                        company: widget.contactList?[widget.index].company,
                        phones: widget.contactList?[widget.index].phones,
                        emails: widget.contactList?[widget.index].emails,
                        isFavorite: true),
                  );
                } else {
                  widget.contactList?[widget.index].isFavorite = false;
                  box?.putAt(
                    widget.index,
                    HiveContact(
                        givenName: widget.contactList?[widget.index].givenName,
                        familyName:
                            widget.contactList?[widget.index].familyName,
                        company: widget.contactList?[widget.index].company,
                        phones: widget.contactList?[widget.index].phones,
                        emails: widget.contactList?[widget.index].emails,
                        isFavorite: false),
                  );
                }
              });
            },
          ),
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (_) {},
            itemBuilder: (BuildContext context) {
              return {'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: TextButton(
                    onPressed: () async {
                      box!.deleteAt(widget.index);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DemoPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    maxRadius: 55,
                    backgroundColor: Colors.yellow,
                    child: Text(
                      widget.contactList![widget.index].givenName[0],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 70,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.contactList![widget.index].givenName,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.videocam_outlined,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 85),
                  child: Text(
                    "Call",
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 84),
                  child: Text(
                    "Text",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    "Video",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.normal),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(8)),
                height: 110,
                width: 340,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 40, top: 5),
                          child: Text(
                            "Contact info",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 45, right: 5),
                              child: Icon(
                                Icons.phone_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Text(
                                    widget.contactList![widget.index].phones,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                const Text(
                                  "Mobile.Default",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 110, top: 60),
                      child: Icon(Icons.videocam_outlined, color: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 60),
                      child: Icon(
                        Icons.chat_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color: Colors.white,
                height: 1,
                width: 360,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Contact Settings",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: Icon(
                    Icons.block_flipped,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 15),
                  child: Text(
                    "Block numbers",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Icon(
                    Icons.voicemail_outlined,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    "Divert to voicemail",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
