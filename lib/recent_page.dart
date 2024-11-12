import 'package:contact_project/demo_page.dart';
import 'package:flutter/material.dart';

import 'favorite_page.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {

  int selectedIndex = 0;

  get contactList => null;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              height: 40,
              // width: 200,
              child: TextFormField(
                onTap: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate( contactList: contactList));
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 35),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Search contacts and places",
                  hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                  suffixIcon: const SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(Icons.mic_none_outlined, color: Colors.white),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Icon(Icons.access_time_outlined,
                      color: Colors.white, size: 200),
                ),
              ],
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
              onPressed: () {},
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
        currentIndex: 1,
        onTap: _onItemTapped,
      ),
    );

  }
}
