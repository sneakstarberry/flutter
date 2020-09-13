import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: {
      //   '/details': (_) => DetailsScreen(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Navigator.defaultRouteName:
            {
              return MyHomePage.route('Demo');
            }

          case '/details':
            {
              return DetailsScreen.route(settings);
            }
        }

        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Material(
              child: Center(
                child: Text("Not found"),
              ),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static Route<dynamic> route(String title) {
    return MaterialPageRoute(
      builder: (BuildContext context) => MyHomePage(title: "Demo"),
    );
  }

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final String name = 'Item $index';
          return ListTile(
            onTap: () {
              // Navigator.of(context).push(DetailsScreen.route(name));
              Navigator.of(context).pushNamed('/details', arguments: name);
            },
            title: Text(name),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  static Route<dynamic> route(RouteSettings settings, [String name]) {
    if (name == null) {
      print(settings.arguments.runtimeType);
      if (settings.arguments is String) {
        name = settings.arguments;
        print('name: $name');
      }
    }
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondanimation) {
        return FadeTransition(
          opacity: animation,
          child: DetailsScreen(name: name),
        );
      },
    );
  }

  const DetailsScreen({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}
