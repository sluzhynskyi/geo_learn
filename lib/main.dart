import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_learn/screens/home_screen.dart';
import 'package:geo_learn/screens/login/login_screen.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/simple_bloc_observer.dart';
import 'repositories/user_repository.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            // return GetStartedScreen(userRepository: _userRepository);
              return LoginScreen(userRepository: _userRepository);
          }

          if (state is AuthenticationSuccess) {
            return HomeScreen(
              user: state.user,
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Center(child: Text("Loading")),
            ),
          );
        }
      )
    );
  }
}