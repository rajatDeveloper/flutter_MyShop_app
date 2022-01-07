import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      backgroundColor: Colors.white70,
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/rd.jpg"),
                ),
                accountName: Text(
                  "Rajat Dhiman",
                  textScaleFactor: 1.3,
                ),
                accountEmail: Text(
                  "rajatdelldhiman@gmail.com",
                ),
              )),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: context.theme.cardColor,
              ),
              textScaleFactor: 1.6,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: context.theme.cardColor,
              ),
              textScaleFactor: 1.6,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Mail us ",
              style: TextStyle(
                color: context.theme.cardColor,
              ),
              textScaleFactor: 1.6,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                color: context.theme.cardColor,
              ),
              textScaleFactor: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
