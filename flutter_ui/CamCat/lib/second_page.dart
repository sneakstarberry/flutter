import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.yellow[700],
          expandedHeight: screenHeight / 5 * 3,
          title: Text("CamCat"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              print('you pressed arrow back!!');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print("you pressed menu!!");
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Placeholder(),
          ),
        ),
      ],
    ));
  }
}
