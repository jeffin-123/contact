import 'package:contact_project/demo_page.dart';
import 'package:contact_project/hive/hive.dart';
import 'package:contact_project/main.dart';

//import 'package:contact_project/hive/hive.dart';
//import 'package:contact_project/models/dummy_data.dart';
import 'package:flutter/material.dart';

//import 'models/contact_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
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
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 50,
          ),
          child: Row(
            children: [
              const Text(
                'Create contact',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    // DummyData.nameList.add(
                    //   Contact(
                    //     givenName: firstNameController.text,
                    //     familyName: surnameController.text,
                    //     company: companyController.text,
                    //     phones: phoneController.text,
                    //     emails: emailController.text,
                    //     isFavorite: false,
                    //   ),
                    // );
                    box!.add(
                      HiveContact(
                          givenName: firstNameController.text,
                          familyName: surnameController.text,
                          company: companyController.text,
                          phones: phoneController.text,
                          emails: emailController.text,
                          isFavorite: true),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DemoPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: CircleAvatar(
                  maxRadius: 45,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add_photo_alternate_outlined,
                      color: Colors.white, size: 40),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.black12,
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Add picture",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 270,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: firstNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "First name",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 60),
              child: Column(
                children: [
                  SizedBox(
                    width: 255,
                    child: TextFormField(
                      controller: surnameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Surname",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(
                    Icons.apartment_sharp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 267,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 30),
                    child: TextFormField(
                      controller: companyController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Company",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(
                    Icons.phone_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 267,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 30),
                    child: TextFormField(
                      controller: phoneController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 165),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Text(
                      "Label",
                      style: TextStyle(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Mobile",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.arrow_drop_down_outlined,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(
                    Icons.mail_outline_sharp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 165),
              child: SizedBox(
                  width: 150,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text(
                        "Label",
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Home",
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.white),
                    ),
                  )),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Significant date",
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 165),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Text(
                      "Label",
                      style: TextStyle(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Birthday",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.arrow_drop_down_outlined,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 42, top: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "More fields",
                      style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    ),
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
