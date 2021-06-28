import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:geo_learn/utils/auth.dart';

class HomeScreen extends StatelessWidget {
  // final UserRepository auth = UserRepository();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (user == null) {
      Future.microtask(() => Navigator.pushNamed(context, "/login"));
      return Scaffold();
    }
    // print(user);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await Auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Column(
          children: [
            // TODO: retrieve points from Firebase
            HomeTitle(user.email, 103),
            QuizzesFeed(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class QuizzesFeed extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.quiz),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Text(
                  "Quizzes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                labelText: "Search",
              ),
              autocorrect: false,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
          // Container(),
          Container(
            width: double.infinity,
            height: 70,
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
            child: TextButton(
              child: Text('Example Quiz',
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
          )
        ],
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  final String? username;
  final int? score;

  HomeTitle(String? username, int? score)
      : username = username,
        score = score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Column(
            children: [
              Center(
                child: Text("Hello, $username"),
                // heightFactor: ,
              ),
              Center(
                child: Text("Points: $score"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
