import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'api/posts.dart';
import 'api/provider.dart';

class PostsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AppState>(
        builder: (context) => AppState(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // @override
  // void initState(){
  //   super.initState();
  //   final appState=Provider.of<AppState>(context, listen:false);
  //   WidgetsBinding.instance.addPostFrameCallback((_) => appState.fetchPosts(http.Client()));
  // }
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   final appState = Provider.of<AppState>(context);
  //   if (appState.getParsePosts() == null) {
  //     WidgetsBinding.instance
  //         .addPostFrameCallback((_) => appState.fetchPosts(http.Client()));
  //   }
  // }
  AppState appState;

  

  @override
  Widget build(BuildContext context) {
    this.appState = Provider.of<AppState>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<List<Post>>(
                stream: appState.results,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                      height: screenHeight/3*2,
                      child:PostsList(
                        screenHeight: screenHeight, snapshot: snapshot),);
                  }
                })
            // StreamBuilder(
            //   stream: appState.fetchPosts(http.Client()),
            //   builder: (context, snapshot) => appState.getParsePosts() != null
            //       ? Container(
            //           height: screenHeight / 2,
            //           child: PostsList(
            //             screenHeight: screenHeight,
            //             snapshot: snapshot
            //           ))
            //       : CircularProgressIndicator(),
            // ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    if (appState != null) {
      appState.dispose();
    }
    super.dispose();
  }
}

class PostsList extends StatefulWidget {
  final double screenHeight;
  final AsyncSnapshot<List<Post>> snapshot;

  PostsList({this.screenHeight, this.snapshot});
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return ListView.builder(
      itemCount: widget.snapshot.data.length,
      itemBuilder: (context, index) => Container(
          height: widget.screenHeight / 3,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(widget.snapshot.data[index].id.toString()),
                    Text(widget.snapshot.data[index].title),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(widget.snapshot.data[index].content),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.snapshot.data[index].created_at),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.snapshot.data[index].updated_at),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}

// class Wewfi extends StatefulWidget {
//   final double valwefue;
//   Wewfi({this.valwefue});

//   @override
//   _WewfiState createState() => _WewfiState();
// }

// class _WewfiState extends State<Wewfi> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.valwefue,
//     );
//   }
// }
