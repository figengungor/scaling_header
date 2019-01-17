import 'package:flutter/material.dart';
import 'package:scaling_header/scaling_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScalingHeader Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
          child: RaisedButton(
        child: Text('Open Profile'),
        onPressed: () {
          Navigator.pushNamed(context, '/profile_page');
        },
      )),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  final double overlapContentHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          ScalingHeader(
            backgroundColor: Colors.red,
            title: Text(
              'James Dean',
            ),
            flexibleSpace: Image.asset(
              'assets/james.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.srcATop,
            ),
            overlapContentBackgroundColor: Colors.redAccent,
            overlapContent: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Tap Bio');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chrome_reader_mode,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Read Bio',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Tap Movies');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.devices,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text('See Movies',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
              child: Text(
                'James Dean was born on February 8, 1931, in Marion, Indiana. '
                    'He starred in the film adaptation of the John Steinbeck novel '
                    'East of Eden, for which he received a posthumous Oscar '
                    'nomination. Dean\'s next starring role as an emotionally '
                    'tortured teen in Rebel Without a Cause made him into the '
                    'embodiment his generation. In early autumn 1955, Dean was killed '
                    'in a car crash, quickly becoming an enduring film icon whose '
                    'legacy has endured for decades. His final film Giant, was also '
                    'released posthumously.\n\n' *
                    50,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
