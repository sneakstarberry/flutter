import 'package:flutter/material.dart';

import 'sm_container.dart';
import 'sm_container.dart';
import 'sm_container.dart';
import 'sm_container.dart';

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SMHome(),
      theme: ThemeData(
        accentColor: Colors.grey.shade200,
        scaffoldBackgroundColor: Colors.grey.shade300,
        backgroundColor: Colors.grey.shade200,
        dialogBackgroundColor: Colors.grey.shade200,
      ),
    );
  }
}

class SMHome extends StatefulWidget {
  @override
  _SMHomeState createState() => _SMHomeState();
}

class _SMHomeState extends State<SMHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade200,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            right: 0,
            top: 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Hello, ",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 32,
                          ),
                        ),
                        TextSpan(
                          text: "Dreamer!",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Aniting I can help you with?",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        SMContainerV2(
                          bevel: 10,
                          shapes: false,
                          child: Icon(Icons.battery_charging_full),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "26.3 ",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "kwh",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Power usage for today",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, top: 16, bottom: 16, right: 16),
                        width: 200,
                        child: SMContainerV2(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: -16,
                                top: 24,
                                child: Container(
                                  height: 160,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://pngimg.com/uploads/bathtub/bathtub_PNG21.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                bottom: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Bathroom",
                                      style: TextStyle(
                                        fontSize: 26,
                                        color: Colors.blueGrey.shade600,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "2 device",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          shapes: true,
                          padding: EdgeInsets.only(
                            bottom: 24,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, top: 16, bottom: 16, right: 16),
                        width: 200,
                        child: SMContainerV2(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: -16,
                                top: 24,
                                child: Container(
                                  height: 160,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://freepngimg.com/thumb/aquarium/43811-6-sofa-bed-free-download-png-hq-thumb.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                bottom: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Living Room",
                                      style: TextStyle(
                                        fontSize: 26,
                                        color: Colors.blueGrey.shade600,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "3 device",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          shapes: true,
                          padding: EdgeInsets.only(
                            bottom: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                // color: Colors.grey.shade400,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.grey.shade50,
                      Colors.grey.shade200,
                      Colors.grey.shade300,
                      Colors.grey.shade400,
                    ]),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(48),
                    topLeft: Radius.circular(48)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: Offset(-24, 8),
                    color: Colors.white,
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 48, right: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        height: 6,
                        width: 52,
                        child: Container(
                          height: 5,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade700,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Quick remote access",
                    style: TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Swipe up to get a fast access to your\nwireless remote control",
                    style: TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontSize: 12,
                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
