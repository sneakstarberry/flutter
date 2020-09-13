import 'package:flutter/material.dart';
import 'dart:ui';


class PageModel {
  final String imageUrl;
  final String title;
  final String body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

List<List<Color>> gradients = [
  [Color(0xff9408cc), Color(0xff43cbff)],
  [Color(0xffe2859f), Color(0xfffccf31)],
  [Color(0xff5efce8), Color(0xff736efe)],
];

var pageList = [
  PageModel(
    imageUrl: "https://github.com/devefy/Flutter-Onboarding/blob/master/assets/illustration.png?raw=true",
    title: "MUSIC",
    body: "EXPERIENCE WICKED PLAYLISTS",
    titleGradient: gradients[0]
  ),
  PageModel(
    imageUrl: "https://github.com/devefy/Flutter-Onboarding/blob/master/assets/illustration2.png?raw=true",
    title: "SPA",
    body: "EXPERIENCE WICKED PLAYLISTS",
    titleGradient: gradients[1]
  ),
  PageModel(
    imageUrl: "https://github.com/devefy/Flutter-Onboarding/blob/master/assets/illustration3.png?raw=true",
    title: "TRAVEL",
    body: "LET'S HIKE UP",
    titleGradient: gradients[2]
  ),

];