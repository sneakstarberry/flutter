import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String content;
  final String created_at;
  final String updated_at;

  Post({this.id, this.title, this.content, this.created_at, this.updated_at });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );


  }
}



List<Post> posts = [
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
  Post(id: 1, title: 'dummy1', content: 'dummy1', created_at: '12', updated_at: '12'),
];