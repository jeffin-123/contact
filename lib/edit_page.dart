//import 'package:contact_project/main.dart';
import 'package:contact_project/hive/hive.dart';

//import 'package:contact_project/models/contact_model.dart';
import 'package:contact_project/profile_page.dart';
import 'package:flutter/material.dart';

//import 'hive/hive.dart';
import 'main.dart';
//import 'models/dummy_data.dart';

// class HiveContact {
//   late String givenName;
//   late String phones;
//
//   HiveContact({required this.givenName, required this.phones});
// }

class EditPage extends StatefulWidget {
  final List<dynamic>? contactList;
  final int index;

  const EditPage({
    super.key,
    this.contactList,
    required this.index,
    HiveContact? contactModel,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.contactList?[widget.index].givenName??"";
    phoneController.text = widget.contactList?[widget.index].phones ?? "";

    super.initState();
  }

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
                builder: (context) => ProfilePage(
                  contactList: widget.contactList,
                  index: widget.index,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(left: 60, top: 50),
          child: Text(
            "Edit contact",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontStyle: FontStyle.normal),
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              side: MaterialStateProperty.all(
                const BorderSide(
                  width: 1,
                ),
              ),
            ),
            onPressed: () async {
              await box!.putAt(
                widget.index,
                HiveContact(
                    givenName: nameController.text,
                    familyName: " ",
                    company: " ",
                    phones: phoneController.text,
                    emails: " ",
                    isFavorite: widget.contactList?[widget.index].isFavorite ?? true),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    contactList: widget.contactList,
                    index: widget.index,
                  ),
                ),
              );
            },
            child: const Text(
              "Save",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (_) {},
            itemBuilder: (BuildContext context) {
              return {'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                maxRadius: 55,
                child: Text(
                  widget.contactList![widget.index].givenName[0],
                  style: const TextStyle(fontSize: 65, color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: TextFormField(
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Icon(
                    Icons.phone_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: TextFormField(
                      controller: phoneController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          label: Text(
                            "Phone",
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
