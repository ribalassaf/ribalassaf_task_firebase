import 'package:flutter/material.dart';
import 'package:ribal_assaf_takehometask/usermodel.dart';
import 'main.dart';

class ListContainer1 extends StatelessWidget {
  final String title;
  final List<User> users;
  ListContainer1({this.title, this.users});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFEDF2F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w900,
                fontSize: 26),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserButton(
                    name:
                        users[index].first_name + " " + users[index].last_name,
                    birthday: users[index].birthday,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class UserButton extends StatelessWidget {
  final String name;
  final String birthday;
  UserButton({@required this.name, this.birthday});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              width: 50.0,
              height: 50.0,
              color: appbarcontentcolor,
              child: Icon(
                Icons.person,
                color: backgroundcolor,
                size: 30.0,
              ),
            ),
          ),
          SizedBox(
            width: 11.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Color(0xFF000000)),
              ),
              Text(
                birthday,
                style: TextStyle(color: Color(0xFF7F7F7F)),
              )
            ],
          )
        ],
      ),
    );
  }
}
