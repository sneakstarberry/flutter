import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String text;
  DetailPage({this.text});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(child: Text(widget.text)),
      ),
    );
  }
}
