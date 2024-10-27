import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900], // Background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('角色管理', style: TextStyle(fontSize: 18)),
              accountEmail: Text('选择或管理你的角色'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'D&D',
                  style: TextStyle(fontSize: 24.0, color: Colors.blueGrey[900]),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
            ),
            ListTile(
              leading: Icon(Icons.switch_account, color: Colors.white),
              title: Text('切换角色', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/switch_character');
              },
            ),
            Divider(color: Colors.white54),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('设置', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to settings
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('关于', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to about
              },
            ),
          ],
        ),
      ),
    );
  }
}
