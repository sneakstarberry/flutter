import 'package:flutter/material.dart';

import '../update_page.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage({this.text, this.animationController, this.messages, this.index});
  String text;
  final List<ChatMessage> messages;
  final int index;
  final AnimationController animationController;
  @override
  ChatMessageState createState() => ChatMessageState();
}

class ChatMessageState extends State<ChatMessage> {
  final String _name = "Your name";


  @override
  Widget build(BuildContext context) {
    debugPrint('ChatMessage Widget hashcode: ${this.hashCode}');
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(child: Text(_name[0])),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_name, style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(this.widget.text),
                  ),
                  Divider(thickness: 2, color: Colors.black)
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon( Icons.refresh),
                onPressed: (){
                  print("refreshed");
                },
              ),
              Padding(
                  padding: EdgeInsets.all(3.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.create,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdatePage(
                                    parent: this)));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
