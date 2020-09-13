import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/model.dart';

class StreamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
      ],
      child: MaterialApp(
        title: "Provider Test",
        home: MainPage(title: "Provider"),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;
  MainPage({Key key, this.title}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MyModel model;
  @override
  Widget build(BuildContext context) {
    this.model = Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Date Without StreamProvider :' + DateTime.now().toString(),
            ),
            StreamProvider<int>.value(
              initialData: 0,
              value: model.secondCountStream,
              child: SecondWidget(),
            ),
            StreamProvider<int>.value(
              value: model.thirdCountStream,
              child: ThirdWidget(),
            ),
            StreamProvider<int>.value(
              value: model.valueStream,
              child: ValueWidget(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (this.model != null) {
      model.dispose();
    }
    super.dispose();
  }
}

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MyModel>(context);
    return Column(
      children: <Widget>[
        Text(
          'Second Current Date :' + DateTime.now().toString(),
        ),
        FlatButton(
            onPressed: () {
              model.updateSecond();
            },
            child: Text(
                "Increment Second: " + Provider.of<int>(context).toString())),
      ],
    );
  }
}

class ThirdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MyModel>(context);
    return Column(
      children: <Widget>[
        Text(
          'Third Current Date :' + DateTime.now().toString(),
        ),
        FlatButton(
          onPressed: () {
            model.updateThird();
          },
          child:
              Text("Increment Third: " + Provider.of<int>(context).toString()),
        ),
      ],
    );
  }
}

class ValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MyModel>(context);
    return Column(
      children: <Widget>[
        Text(
          'Listening a value :' + Provider.of<int>(context).toString(),
        ),
        FlatButton(
          onPressed: () {
            model.changeValue();
          },
          child: Text("Change Value"),
        ),
      ],
    );
  }
}
