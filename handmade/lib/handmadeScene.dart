import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handmade/item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const Color primaryColor = Color(0xff8c6e6b);
const Color secondaryColor = Color(0xffc5bcbc);

class HandMadeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HandMadeHomePage(),
        '/home': (context) => HandMadeMainPage(),
      },
    );
  }
}

class HandMadeMainPage extends StatefulWidget {
  @override
  _HandMadeMainPageState createState() => _HandMadeMainPageState();
}

class _HandMadeMainPageState extends State<HandMadeMainPage> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "http://cdn.pixabay.com/photo/2015/12/29/07/05/young-girl-1112378_960_720.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 13,
            right: 13,
            top: 70,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  Icon(Icons.add_shopping_cart, color: Colors.white)
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            top: MediaQuery.of(context).size.height / 1.75,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "METAMORPHOSE",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          letterSpacing: 1.2,
                          color: Color(0xff8c6e6b),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "DRAGONFLY WINGS",
                        style: GoogleFonts.merriweather(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Headpiece with wings of dragonflies very elegantly"
                        "complement to you look at special events, parties, "
                        "weddings or just can bring to your everyday cloths more "
                        "originality",
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 2,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                          height: 38,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Text("\$55", style: TextStyle())),
                              Expanded(
                                flex: 8,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                      ),
                                      color: Color(0xff8c6e6b),
                                    ),
                                    child: Center(
                                      child: Text("see details",
                                          style: GoogleFonts.merriweather(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          )),
                                    )),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            bottom: MediaQuery.of(context).size.height / 2.2,
            right: 16,
            top: MediaQuery.of(context).size.height / 1.9,
            child: Container(
              height: 16,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: WormEffect(
                    activeDotColor: Color(0xffC5BCBC),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HandMadeHomePage extends StatefulWidget {
  @override
  _HandMadeHomePageState createState() => _HandMadeHomePageState();
}

class _HandMadeHomePageState extends State<HandMadeHomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  List<Widget> _buildBackground() {
    return [
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/03/30/18/17/girl-2189247_960_720.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.blueGrey, BlendMode.color))),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height / 2.5,
        child: Container(
          height: MediaQuery.of(context).size.height / 3.4,
          color: Colors.white,
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height / 2.5 * 1.75,
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          color: secondaryColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ..._buildBackground(),
          Positioned(
            left: 24,
            right: 0,
            top: MediaQuery.of(context).size.height / 3,
            child: Container(
              height: 100,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 24, bottom: 24),
                      margin: EdgeInsets.only(right: 24),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(23),
                          bottomLeft: Radius.circular(23),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "METAMORPHOSE",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "BIRD BROOCH",
                                style: GoogleFonts.merriweather(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 4,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/home");
                                  },
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height / 2.1,
            child: Container(
              height: 32,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: primaryColor,
                    dotColor: secondaryColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 0,
            top: MediaQuery.of(context).size.height / 1.85,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Best Sellers",
                      style: GoogleFonts.merriweather(
                        fontSize: 22,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                        itemCount: bestSellers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 16),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 6,
                                  child:
                                      // Container(
                                      //   height: double.infinity,
                                      //   width: double.infinity,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //         image: NetworkImage(
                                      //             bestSellers[index].img),
                                      //         fit: BoxFit.cover),
                                      //   ),
                                      // ),
                                      Image.network(
                                    bestSellers[index].img,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            bestSellers[index].title,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                    "\$${bestSellers[index].price}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ))),
                                            Expanded(
                                              flex: 6,
                                              child: bestSellers[index]
                                                      .freeDelivery
                                                  ? Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      child: Center(
                                                          child: Text(
                                                              "Free delivery",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      primaryColor))),
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "New Arrivals",
                            style: GoogleFonts.merriweather(
                                fontSize: 22, letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/03/15/17/17/girl-1258739__340.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
