import 'package:flutter/material.dart';

import 'package:geo_learn/repositories/user_repository.dart';

import 'package:geo_learn/screens/home_screen.dart';
import 'package:geo_learn/screens/login/login_screen.dart';
import 'package:geo_learn/screens/register/register_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GeoLearn()
  );
}

class GeoLearn extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<Report>.value(stream: Global.reportRef.documentStream),
        StreamProvider<User?>.value(value: FirebaseAuth.instance.authStateChanges(), initialData:null),
        ],
      child: AppRouter()
      );
  }
}

class AppRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    User? user = Provider.of<User?>(context);
    print(user);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
                // Named Routes
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
        }
    );
  }
}
