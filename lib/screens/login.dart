import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/api_error.dart';
import 'package:flutter_app_1/models/api_response.dart';
import 'package:flutter_app_1/services/api.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;

  ApiResponse _apiResponse = new ApiResponse();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleSubmitted() async {
    _apiResponse = await authenticateUser(
        _usernameController.text, _passwordController.text);

    if ((_apiResponse.ApiErrors as ApiError) == null) {
      if (_apiResponse.Data != null) {
        _saveAndRedirectToHome();
      } else {
        showInSnackBar('Unsuccessful login, Username or Password is incorrect');
      }
    } else {
      showInSnackBar((_apiResponse.ApiErrors as ApiError).error);
    }
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  void _saveAndRedirectToHome() {}

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/pngwing.com.png'),
              width: 250,
              height: 250,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _usernameController,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    suffixIcon: Icon(Icons.login)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Passsword',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    suffixIcon: Icon(Icons.password)),
              ),
            ),
            // ElevatedButton(onPressed: (){}, child: Text('Login'))
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(35.0)),
              child: MaterialButton(
                onPressed: _handleSubmitted,
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
