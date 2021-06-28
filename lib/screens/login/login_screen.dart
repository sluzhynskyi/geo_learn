import 'package:geo_learn/utils/validators.dart';
import 'package:geo_learn/utils/auth.dart';
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
      Future.microtask(() => Navigator.pushNamed(context, "/"));
      return Scaffold();
    }
    //TODO: need better UI
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Text(
              'Login to Start',
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Email",
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              validator: (_) {
                return !Validators.isValidEmail(email) ? 'Invalid Email' : null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Password",
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
            Container(
              child: TextButton(
                child: Text('Log in', textAlign: TextAlign.center),
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
                margin: EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: Text('Sign Up', textAlign: TextAlign.center),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                )),
            Builder(builder: (context) {
              // print(loginError);
              if (loginError != "") {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        
                            ),
                    width: double.infinity,
                    child: Text(loginError,
                        style: TextStyle(color: Colors.white))
                 );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
