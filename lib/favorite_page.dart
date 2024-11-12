//import 'dart:ffi';

import 'package:contact_project/demo_page.dart';
import 'package:contact_project/profile_page.dart';
import 'package:contact_project/recent_page.dart';
import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';


//import 'hive/hive.dart';
import 'main.dart';
//import 'models/dummy_data.dart';

class FavoritePage extends StatefulWidget {
  final List<dynamic> favoriteList;

  const FavoritePage({super.key,  required this.favoriteList});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedIndex = 0;
   List<dynamic> contactList=[];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

  }
  @override
  void initState() {
    super.initState();
    contactList=box!.values.toList();
    print(contactList.length);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.black12,
              height: 1460,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Logic to check if a new section header is needed
                  if (contactList[index].isFavorite == false) {
                    // Display section header
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: Text(contactList[index].givenName[0],
                                style: const TextStyle(color: Colors.blue)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                contactList[index].givenName[0],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          // Widget displaying the contact information
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    contactList: contactList,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                contactList[index].givenName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Display contact information without section header
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePage(favoriteList: [],),
                  ),
                );
              },
              icon: const Icon(
                Icons.star_border_outlined,
                color: Colors.white,
              ),
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecentPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.access_time_outlined,
                color: Colors.white,
              ),
            ),
            label: "Recent",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DemoPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.people_alt_sharp,
                color: Colors.white,
              ),
            ),
            label: "Contacts",
          ),
        ],
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
