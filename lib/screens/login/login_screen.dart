import 'package:geo_learn/blocs/login_bloc/login_bloc.dart';
import 'package:geo_learn/repositories/user_repository.dart';
import 'package:geo_learn/screens/login/login_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const LoginScreen({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(UserRepository: _userRepository),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 230),

                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: LoginForm(userRepository: _userRepository,),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

