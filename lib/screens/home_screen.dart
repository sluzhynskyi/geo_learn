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
      body: Center(
        child: Column(
          children: [
            HomeTitle(user.email, 103),
            Row(
              children: [
                Icon(Icons.quiz),
                Text("Quizzes"),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                labelText: "Search",
              ),
              autocorrect: false,
            ),
            Text("Categories"),
            // Container(),
            TextButton(
                child: Text('Quiz', textAlign: TextAlign.center),
                onPressed:(){
                  Navigator.pushNamed(context, "/quiz");
                }
            )
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

class HomeTitle extends StatelessWidget {
  final String? username;
  final int? score;

  HomeTitle(String? username, int? score):username=username, score=score;

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
