import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:syu_clubs_app/api/posts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';


class AppState with ChangeNotifier {
  List<Post> _posts=[];
  // String _jsonResponse="";
  bool _isLoading=false;

  AppState(){
    getTodo();
  }

  // List<Post> getParsePosts() {
  //   if(_jsonResponse.isNotEmpty){
  //     final result = json.decode(_jsonResponse);
  //     print(result);
  //     _posts = result.map<Post>((json) => Post.fromJson(json)).toList();
  //     return _posts;
  //   }
  //   return null;
  // }

  Future<List<Post>> fetchPosts(http.Client client) async {
    _isLoading = true;
    notifyListeners();
    await client.get('http://10.0.2.2:8000')
      .then((res){
        print(res.body);
        return res.body;})
      .then(json.decode)
      .then((posts) =>
        posts.forEach((post)=> _posts.add(Post.fromJson(post))));
    _isLoading = false;
    notifyListeners();
    return _posts;

    
  }

  StreamController<List<Post>> ctrl = StreamController();

  Stream<List<Post>> get results => ctrl.stream;
  @override
  void dispose(){
    super.dispose();
    ctrl.close();
  }

  void getTodo() {
    fetchPosts(http.Client()).then((posts) => 
      ctrl.add(posts));
  }


  bool get isFetched => _isLoading;
}
