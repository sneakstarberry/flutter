import 'dart:async';
import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<List<Photo>> fetchPhotos(http.Client client) async {
//   final response =
//       await client.get('https://jsonplaceholder.typicode.com/photos');

//   print(response.body);

//   // compute 함수를 사용하여 parsePhotos를 별도 isolate에서 수행합니다.
//   return compute(parsePhotos, response.body);
// }

// // 응답 결과를 List<Photo>로 변환하는 함수.
// List<Photo> parsePhotos(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }

// class Photo {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }

void main() => runApp(Myapp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Isolate Demo';

//     return MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: FutureBuilder<List<Photo>>(
//         future: fetchPhotos(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? PhotosList(photos: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   final List<Photo> photos;

//   PhotosList({Key key, this.photos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Image.network(photos[index].thumbnailUrl);
//       },
//     );
//   }
// }
//////////////////////////////////////////////////////////////////////////////////

// Future<User> fetchUser() async {
//   final response = await http.get('http://10.0.2.2:8888/api/v1/users/1');

//   if (response.statusCode == 200) {
//     print('status Code 200!!');
//     var result = response.body[2];
//     print(result);
//     var parsed = json.decode(response.body);
//     print(parsed['response']);
//     return User.fromJson(parsed['response']);
//   }else {
//     print(response);
//     throw Exception('Failed to load User Data');
//   }
// }

// class User {
//   final String username;
//   final String email;

//   User({ this.username, this.email});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       username: json['username'],
//       email: json['email'],
//     );
//   }
// }

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "something",
      home: Scaffold(
        appBar: AppBar(
          title: Text("something"),
        ),
        body: FutureBuilder<List<Post>>(
          future: fetchPosts(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? PostsList(posts: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody);
  final result = parsed['response'];
  var test = result.map<Post>((json) => Post.fromJson(json)).toList();
  print(test[0].image);
  return result.map<Post>((json) => Post.fromJson(json)).toList();
}

Future<List<Post>> fetchPosts(http.Client client) async {
  final response = await client.get('http://10.0.2.2:8001/api/v1/posts');
  return compute(parsePosts, response.body);
}

class Post {
  final int id;
  final String title;
  final String content;
  final String image;
  final String created_at;
  final String updated_at;

  Post(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.created_at,
      this.updated_at});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['Image'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;
  PostsList({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          color: Colors.transparent.withOpacity(0.2),
          margin: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.network(
                    posts[index].image,
                    width: 90,
                  ),
                ),
                SizedBox(width: 6.0),
                Container(
                  width: 210.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        child: Text(
                          posts[index].title,
                          style: TextStyle(fontSize: 22.0),
                          maxLines: 1,
                        ),
                        
                      ),
                      Text(posts[index].content),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class ApiApp extends StatefulWidget {
//   ApiApp({Key key}) : super (key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<ApiApp> {
//   Future<User> user;

//   @override
//   void initState() {
//     super.initState();
//     user = fetchUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("지랄 $user");
//     // print(fetchUser());

//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<User> (
//             future: user,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.username);
//               }else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator();
//             },
//           )
//         )
//       )
//     );
//   }
// }
