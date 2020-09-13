import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget cardSection = Center(
      child: Card(
        elevation: 5,
        child: Container(
          height: 100.0,
          child: Row(
            children: <Widget>[
              Container(
                // height: 100.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/imageMask.png'),
                  ),
                ),
              ),
              Container(
                height: 100,
                // width: 200,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'setsetset',
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                        child: Container(
                          width: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "30",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                        child: Container(
                          width: 220,
                          child: Text(
                            'waefioawefjaweoifjsdfasdfsadfasdfasdfasdfasdfasdfasdf',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 48, 48, 54)),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    Widget imageWidget = Image.asset(
      'images/imageMask.png',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
      color: Colors.black,
    );
    Widget utilSection = Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
        ],
      ),
    );
    Widget textSection = Container(
      margin: EdgeInsets.only(
        top: 80,
        left: 15,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('추천',
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 15, color: Colors.white)),
          Text('기어 가이드',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text('제작: Talin Wadwortlin',
              style: TextStyle(fontSize: 17, color: Colors.white)),
        ],
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                imageWidget,
                utilSection,
                textSection,
                Container(
                  height: 240,
                  width: 600,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xCC000000),
                        const Color(0x00000000),
                        const Color(0x00000000),
                        const Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
              ),
              child: Text(
                '모험 포스트',
                style: TextStyle(color: Colors.green[700]),
              ),
            ),
            cardSection,
            cardSection,
            cardSection,
            cardSection,
            cardSection,
          ],
        ),
      ),
    );
  }
}
