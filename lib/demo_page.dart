import 'package:contact_project/create_page.dart';
import 'package:contact_project/dial_page.dart';
import 'package:contact_project/favorite_page.dart';
import 'package:contact_project/hive/hive.dart';
import 'package:contact_project/profile_page.dart';
import 'package:contact_project/recent_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'models/contact_model.dart';
//import 'models/dummy_data.dart';


class DemoPage extends StatefulWidget {
  const DemoPage({super.key, Contact? contactModel});

  @override
  State<DemoPage> createState() => _DemoPage();
}

class _DemoPage extends State<DemoPage> {
  List<dynamic> contactList =[];


  @override
  void initState() {


    // TODO: implement initState
    super.initState();
    contactList= box!.values.toList();
    print(contactList.length);
  }


  @override
  Widget build(BuildContext context) {
    contactList.sort((a, b) {
      return a.givenName.toLowerCase().compareTo(
            b.givenName.toLowerCase(),
          );
    });
    final bool showFAB = MediaQuery.of(context).viewInsets.bottom == 0.0;
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
                      context: context, delegate: CustomSearchDelegate(contactList: contactList));
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_add_alt, color: Colors.blue),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreatePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Create new contact",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black12,
              height: 1460,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Logic to check if a new section header is needed
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 14,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            contactList[index].givenName[0],
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: CircleAvatar(
                            // backgroundColor:
                            //     nameList[index].color ?? Colors.yellow,
                            backgroundColor: Colors.blue,
                            // backgroundColor:
                            //     nameList[index].color ?? Colors.yellow,
                            child: Text(
                              contactList[index].givenName[0],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        // Widget displaying the contact information
                        TextButton(
                          onPressed: () async {
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
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: showFAB,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DialPage(),
              ),
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.dialpad_sharp),
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
              onPressed: () {},
              icon: const Icon(
                Icons.people_alt_sharp,
                color: Colors.white,
              ),
            ),
            label: "Contacts",
          ),
        ],
        currentIndex: 2,
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<dynamic> contactList;
  CustomSearchDelegate({required this.contactList});
  List<HiveContact> matchQuery = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    matchQuery.clear(); // Clear the list before adding new items
    for (var contact in box!.values.toList()) {
      if (contact.givenName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(contact);
      }
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        // Logic to check if a new section header is needed
        if (index == 0 ||
            matchQuery[index].givenName[0] !=
                matchQuery[index - 1].givenName[0]) {
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
                  child: Text(
                    matchQuery[index].givenName[0],
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      matchQuery[index].givenName[0],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                // Widget displaying the contact information
              ],
            ),
          );
        } else {
          // Display contact information without section header
          return ListTile(
            title: Text(matchQuery[index].givenName),
            // Other contact details
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = box!.values.toList().where((contact) {
      return contact.givenName.toLowerCase().contains(query.toLowerCase());
    }).toList();
    matchQuery.sort((a, b) {
      return a.givenName.toLowerCase().compareTo(b.givenName.toLowerCase());
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index) {
          // Logic to check if a new section header is needed
          if (index == 0 ||
              matchQuery[index].givenName[0] !=
                  matchQuery[index - 1].givenName[0]) {
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
                    child: Text(
                      matchQuery[index].givenName[0],
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        matchQuery[index].givenName[0],
                        style: const TextStyle(color: Colors.white, fontSize: 20),
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
                            contactList:contactList, // Pass matchQuery here
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        matchQuery[index].givenName,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Display contact information without section header
            return ListTile(
              title: Text(matchQuery[index].givenName),
              // Other contact details
            );
          }
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          // headline 6 affects the query text
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}