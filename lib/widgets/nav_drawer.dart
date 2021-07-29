import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue)),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text('Example Widgets'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: _handleLogout,
          )
        ],
      ),
    );
  }
}
