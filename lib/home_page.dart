// import 'package:contact_project/create_page.dart';
// import 'package:contact_project/profile_page.dart';
// import 'package:flutter/material.dart';
//
// import 'models/contact_model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white12,
//       appBar: AppBar(
//         backgroundColor: Colors.white12,
//         flexibleSpace: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
//               height: 40,
//               // width: 200,
//               child: TextFormField(
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(left: 35),
//                       prefixIcon: const Icon(Icons.search, color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Colors.transparent,
//                         ),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       hintText: "Search contacts and places",
//                       hintStyle: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontStyle: FontStyle.normal),
//                       suffixIcon: const SizedBox(
//                         width: 50,
//                         child: Row(
//                           children: [
//                             Icon(Icons.mic_none_outlined, color: Colors.white),
//                             Icon(
//                               Icons.more_vert_outlined,
//                               color: Colors.white,
//                             )
//                           ],
//                         ),
//                       ))),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.person_add_alt, color: Colors.blue),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const CreatePage(),
//                           ));
//                     },
//                     child: const Text(
//                       "Create new contact",
//                       style: TextStyle(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 20,
//                           color: Colors.blue),
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 1460,
//               child: ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: nameList.length,
//                   itemBuilder: (context, index) {
//                     if (index == 0 ||
//                         nameList[index].name[0] !=
//                             nameList[index - 1].name[0]) {
//                       return SizedBox(
//                         width: MediaQuery.of(context).size.width / 1,
//                         height: MediaQuery.of(context).size.height / 14,
//                         child: Row(
//                           children: [
//                             Text(nameList[index].name[0]),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 65),
//                               child: CircleAvatar(
//                                 backgroundColor:
//                                     nameList[index].color ?? Colors.yellow,
//                                 child: Text(nameList[index].name[0],
//                                     style: const TextStyle(
//                                         color: Colors.white, fontSize: 20)),
//                               ),
//                             ),
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProfilePage(
//                                         contactModel: nameList[index],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.8,
//                                   child: Text(
//                                     nameList[index].name,
//                                     style: const TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                         fontStyle: FontStyle.normal),
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       );
//                     }else {
//                       return const Text("data");
//                     }
//                   }),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.blue,
//         child: const Icon(Icons.dialpad_sharp),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white12,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.white,
//         selectedFontSize: 11,
//         unselectedFontSize: 11,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.star_border), label: "Favourites"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.access_time_outlined), label: "Recent"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.people_sharp), label: "Contacts"),
//         ],
//       ),
//     );
//   }
// }
