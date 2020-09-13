import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_todo/detail_page.dart';
import 'package:session_todo/login_page.dart';
import 'package:session_todo/widget/chatBox.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<ChatMessage> _messages = <ChatMessage>[];
  ScrollController _scrollController;
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      messages: _messages,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
    _isComposing = false;
  }

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);

    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight / 5,
              child: Center(
                child: Container(
                  height: screenHeight / 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.account_circle,
                      size: screenHeight / 7.0,
                    ),
                  ),
                ),
              ),
            ),

            Text('로그인을 필요합니다.'),
            SizedBox(
              height: 8.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ),
                );
              },
              child: Text('Login', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      )),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: screenHeight / 7 * 2,
            title: Text(
              "TodoApp",
              style: GoogleFonts.montserrat(
                  color: isShrink ? Colors.black : Colors.white, fontSize: 25),
            ),
            centerTitle: true,
            pinned: true,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu,
                    color: isShrink ? Colors.black : Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search,
                    color: isShrink ? Colors.black : Colors.white),
                onPressed: () {
                  print("print");
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/11/20/08/03/flowerpot-1842098_960_720.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 24,
                    left: 24,
                    child: Container(
                      height: 38,
                      margin: EdgeInsets.all(4.0),
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: TextField(
                          onSubmitted: _handleSubmitted,
                          controller: _textController,
                          onChanged: (String text) =>
                              setState(() => _isComposing = text.length > 0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.add, color: Colors.tealAccent),
                            hintText: "Todo",
                            hintStyle: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final _message = _messages[index];
                return Dismissible(
                  key: ObjectKey(_message),
                  onDismissed: (direction) {
                    print(context);
                    if (_messages.contains(_message)) {
                      setState(
                        () {
                          _messages.removeAt(index);
                        },
                      );
                    }
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("message $index dismissed"),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "Message Deleted",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, color: Colors.white),
                    )),
                  ),
                  child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(text:_messages[index].text))),
                    child: _messages[index]),
                );
              },
              childCount: _messages.length,
            ),
          ),
        ],
      ),
    );
  }
}
