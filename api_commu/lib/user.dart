import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// Future<http.Response> fetchUser() {
//   return http.get('http://127.0.0.1:8888/api/v1/users');
// }
Future<User> fetchUser() async {
  final response = await http.get('http://127.0.0.1:8888/api/v1/users/1');

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  }else {
    throw Exception('Failed to load User Data');
  }
}

class User {
  final String username;
  final String email;

  User({ this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
    );
  }
}

class ApiApp extends StatefulWidget {
  ApiApp({Key key}) : super (key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ApiApp> {
  Future<User> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<User> (
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.username);
              }else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          )
        )
      )
    );
  }
}

