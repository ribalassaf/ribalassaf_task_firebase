import 'package:flutter/material.dart';
import 'package:ribal_assaf_takehometask/usermodel.dart';
import 'package:ribal_assaf_takehometask/widgets.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getusers() async {
    UserButton temp;
    User temp1;
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        temp1 = new User(
            first_name: doc["first_name"],
            last_name: doc["last_name"],
            fullname: doc["first_name"] + " " + doc["last_name"],
            birthday: doc["birthday"].toString(),
            admin: doc["admin"]);
      });
      allUsers1.add(temp1);
      allUsersAlphabeticallySort.add(temp1);
      if (temp1.admin == true) allAdmins1.add(temp1);
    });
  }

  List<User> allAdmins1 = [];
  List<User> allUsers1 = [];
  List<User> allUsersAlphabeticallySort = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    allUsersAlphabeticallySort.sort((a, b) => a.fullname.compareTo(b.fullname));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style:
              TextStyle(color: appbarcontentcolor, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: appbarcontentcolor,
            size: 30.0,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 26.0),
        child: Column(
          children: [
            Expanded(
              child: ListContainer1(
                title: "List of All users",
                users: allUsers1,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: ListContainer1(
                title: "List of Admins only",
                users: allAdmins1,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: ListContainer1(
                title: "Alphabetically sorted list",
                users: allUsersAlphabeticallySort,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
