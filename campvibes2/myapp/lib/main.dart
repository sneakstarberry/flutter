import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // 컨테이너 안에 알맞게 넣기위해서 쓴다.
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                // padding을 이용하기 위해서 container를 쓴다.
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Icons.call, 'CALL'),
          _buildButtonColumn(Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      theme: myTheme,
      title: 'Welcome to layout Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to layout Flutter',
                style: myTheme.textTheme.headline1),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width:600,
                height:240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
              Center(child:Image.asset(
                'images/bigdata.jpg',
                width:384,
                height:576,
                fit: BoxFit.cover
              ))
            ],
          ),
          ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _favoriteCount -=1;
      _isFavorited= false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star):Icon(Icons.star_border)),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 30,
          child: Container(
            child: Text('$_favoriteCount'),
          )
        )
      ],
    );
  }
}

