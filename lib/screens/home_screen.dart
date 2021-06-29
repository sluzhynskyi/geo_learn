import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:geo_learn/utils/auth.dart';
import 'package:geo_learn/utils/database.dart';

class HomeScreen extends StatelessWidget {
  // final UserRepository auth = UserRepository();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (user == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, "/login"));
      return Scaffold();
    }
    // print(user);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF85B5E1), Color(0xFFE9F5E2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: Column(
          children: [
            FutureBuilder(future: DatabaseManager.getScore(user.uid),
        initialData:0,
        builder: (BuildContext context, AsyncSnapshot<int> score) {
          return QuizzesFeed(user.email, score.data);
        }),
          ],
        ),
      ),
    );
  }
}

class QuizzesFeed extends StatelessWidget {
  final String? username;
  final int? score;

  QuizzesFeed(String? username, int? score)
      : username = username,
        score = score;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
                Image.asset('assets/images/planet-earth.png', height: 100, width: 100),
                SizedBox(height: 20),  
                  Text(
                  'GeoLearn',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Score: $score',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  // padding: EdgeInsets.bottom(30),
                ),
                SizedBox(height: 20),
                  Text(
                    'Hi $username !\n Select a quiz and start learning.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
          Row(
          ),
          
          SizedBox(height: 20),
          
          Container(
            height: 60.0,
            width: 350.0,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen[100],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                )
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(156, 235, 124, 1))),
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(156, 235, 124, 1),
              textColor: Colors.white,
              child: Text('Beginner Quiz',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pushNamed(context, "/quiz");
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60.0,
            width: 350.0,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen[100],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                )
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
           child: RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(224, 220, 79, 1))),
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(0224, 220, 79, 1),
              textColor: Colors.white,
              child: Text('Master Quiz',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pushNamed(context, "/quiz");
              },
            ),
            
          ),
          SizedBox(height: 20),
          Container(
            height: 60.0,
            width: 350.0,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen[100],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                )
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(224, 185, 79, 1))),
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(224, 185, 79, 1),
              textColor: Colors.white,
              child: Text('Skilled Quiz',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pushNamed(context, "/quiz");
              },
            ),
            
          ),
          SizedBox(height: 20),
          Container(
            height: 60.0,
            width: 350.0,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen[100],
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                )
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(222, 69, 55, 1))),
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(222, 69, 55, 1),
              textColor: Colors.white,
              child: Text('Expert Quiz',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pushNamed(context, "/quiz");
              },
            ),
          ),
          SizedBox(height: 20),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await Auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}

