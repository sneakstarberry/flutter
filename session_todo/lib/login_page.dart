import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_todo/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[

                SizedBox(height: 16.0),
                Text('Todo', style:GoogleFonts.montserrat(fontSize: 18,)),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              onSubmitted: (String text){
                _usernameController.clear();
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              onSubmitted: (String text){
                _passwordController.clear();
              },
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    // Navigator.pop(context);
                    print('username: ${_usernameController.text}\npassword:  ${_passwordController.text}');
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
