import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends StatefulWidget {
  Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _userId = "";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = (prefs.getString('userId') ?? "");

    if (_userId == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      ApiResponse _apiResponse = await getUserDetails(_userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('test landing'),
    );
  }
}
