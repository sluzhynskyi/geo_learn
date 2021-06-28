import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:geo_learn/utils/auth.dart';

class HomeScreen extends StatelessWidget {
  // final UserRepository auth = UserRepository();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if(user == null){
      Future.microtask(() => Navigator.pushNamed(
        context, 
        "/login"
      ));
      return Scaffold();
    }
    print(user);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async{
              await Auth.signOut();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Hello, ${user.email}"),
          ),
        ],
      ),
    );
  }
}
