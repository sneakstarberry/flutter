import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_page.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage>
    with SingleTickerProviderStateMixin {
  List<int> soundBars = [];
  double barWidth = 5.0;
  double soundPosition = 0.0;
  AnimationController _animationController;
  bool isPlaying = false;
  Random r = math.Random();
  double nextSoundPosition;
  double percentage;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    for (int i = 0; i < 80; i++) {
      soundBars.add(r.nextInt((52)));
      nextSoundPosition = r.nextInt((100)).toDouble();
      percentage = nextSoundPosition / 100;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(nextSoundPosition);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    int i = 0;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            right: 16,
            top: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Icon(Icons.favorite_border),
              ],
            ),
          ),
          Positioned(
            left: 64,
            right: 64,
            top: 120,
            child: Container(
              height: screenWidth - 128,
              width: screenWidth - 128,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__340.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 100,
            child: Container(
                height: 350,
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: ArcPainter(percent: percentage),
                )),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 480,
            child: Container(
              height: 180,
              child: Column(
                children: <Widget>[
                  Icon(Icons.music_note),
                  SizedBox(height: 12),
                  Text(
                    "Sam Fischer",
                    style: GoogleFonts.montserrat(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "This City",
                    style: GoogleFonts.montserrat(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 52,
                    child: Row(
                      children: soundBars.map((h) {
                        Color color = i >= soundPosition / barWidth &&
                                i <= nextSoundPosition / barWidth
                            ? backgroundColor
                            : Colors.grey;
                        i++;
                        return Container(
                          margin: EdgeInsets.only(right: 1.0),
                          color: color,
                          height: h.toDouble(),
                          width: 4,
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("1:35",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold)),
                      Text(
                        "3:42",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 24,
              right: 24,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        soundBars.clear();

                        setState(() {
                          for (int i = 0; i < 80; i++) {
                            soundBars.add(r.nextInt((52)));
                            nextSoundPosition = r.nextInt((400)).toDouble();
                            percentage = nextSoundPosition / 400;
                          }
                        });
                      }),
                  Icon(Icons.skip_previous),
                  GestureDetector(
                    onTap: () {
                      _handleOnPressed();
                    },
                    child: Card(
                      elevation: 12,
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        height: 84,
                        width: 48,
                        child: Center(
                          child: AnimatedIcon(
                              color: Colors.white,
                              icon: AnimatedIcons.play_pause,
                              progress: _animationController),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.skip_next),
                  Icon(Icons.shuffle),
                ],
              ))
        ],
      ),
    );
  }

  _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}

class ArcPainter extends CustomPainter {
  static const double strokeWidth = 10.0;
  double percent = 0.3;
  ArcPainter({this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final starAngle = -math.pi;
    final useCenter = false;
    final bgSweepAngle = -math.pi;
    final bgPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final bgrect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width / 2 - bgPaint.strokeWidth / 2,
            size.height / 2 - bgPaint.strokeWidth / 2));

    canvas.drawArc(bgrect, starAngle, bgSweepAngle, useCenter, bgPaint);
    final sweepAngle = -math.pi * percent;
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width / 2 - paint.strokeWidth / 2,
            size.height / 2 - paint.strokeWidth / 2));

    canvas.drawArc(rect, starAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ArcPainter old) {
    // TODO: implement shouldRepaint
    return old.percent != percent;
  }
}
