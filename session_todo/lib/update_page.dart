import 'package:flutter/material.dart';
import 'package:session_todo/widget/chatBox.dart';

class UpdatePage extends StatefulWidget {
  ChatMessageState parent;
  UpdatePage({this.parent});
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: this.widget.parent.widget.text ,
                  )),
              FlatButton(
                onPressed: () {
                  setState((){
                    this.widget.parent.widget.text = _textEditingController.text;
                  });
                  this.widget.parent.setState(() {
                    this.widget.parent.widget.text = _textEditingController.text;
                  });
                  _textEditingController.clear();
                },
                child: Text("Edit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
