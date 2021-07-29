import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/api_error.dart';
import 'package:flutter_app_1/models/api_response.dart';
import 'package:flutter_app_1/models/user.dart';
import 'package:flutter_app_1/services/api.dart';
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
    //showInSnackBar(_userId);
    if (_userId == "") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      ApiResponse _apiResponse = await getUserDetails(_userId);
      if ((_apiResponse.ApiErrors as ApiError).error == '') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', ModalRoute.withName('/home'),
            arguments: (_apiResponse.Data as User));
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ModalRoute.withName('/login'));
      }
    }
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
