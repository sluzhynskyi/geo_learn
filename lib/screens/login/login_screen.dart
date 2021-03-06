import 'package:geo_learn/utils/validators.dart';
import 'package:geo_learn/utils/auth.dart';
import 'package:geo_learn/widgets/error.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  // final UserRepository auth = UserRepository();
  get email => _emailController.text;
  get password => _passwordController.text;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String loginError = "";

  @override
  void initState() {
    super.initState();
  }

  Widget build(context) {
    User? user = Provider.of<User?>(context);
    if (user != null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, "/"));
      return Scaffold();
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF85B5E1), Color(0xFFE9F5E2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20),
                    Image.asset('images/planet-earth.png',
                        height: 100, width: 100),
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
                    Text(
                      'Let???s learn  interesting facts\n about all Countries  in the World!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 70),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 165, 220, 15), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 165, 220, 15)),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      validator: (_) {
                        return !Validators.isValidEmail(email)
                            ? 'Invalid Email'
                            : null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 165, 220, 15), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 165, 220, 15)),
                        ),
                      ),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      validator: (_) {
                        return !Validators.isValidPassword(password)
                            ? 'Invalid Password'
                            : null;
                      },
                    ),
                    SizedBox(height: 100),
                    Container(
                      height: 50.0,
                      width: 200.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromRGBO(0, 165, 220, 15))),
                        padding: EdgeInsets.all(10.0),
                        color: Color.fromRGBO(0, 165, 220, 1),
                        textColor: Colors.white,
                        child: Text('Log In', style: TextStyle(fontSize: 15)),
                        onPressed: () async {
                          try {
                            var user = await Auth.signIn(email, password);
                          } catch (error) {
                            setState(() {
                              loginError = "Incorrect password or e-mail";
                            });
                          }
                          if (user != null) {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                      ),
                    ),
                    Container(
                        height: 50.0,
                        width: 200.0,
                        margin: EdgeInsets.only(bottom: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromRGBO(0, 160, 227, 1))),
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white,
                          textColor: Color.fromRGBO(0, 160, 227, 1),
                          child:
                              Text('Sign Up', style: TextStyle(fontSize: 15)),
                          onPressed: () async {
                            Navigator.pushReplacementNamed(
                                context, '/register');
                          },
                        )),
                    ShowError(loginError)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
