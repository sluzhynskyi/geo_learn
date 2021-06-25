import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geo_learn/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutInToState();
    }
  }

  // AuthenticationStarted
  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = _userRepository.isSignedIn();
    if (isSignedIn) {
      final user = _userRepository.getCurrentUser();

      if (user != null) {
        yield AuthenticationSuccess(user);
      }
    } else {
      yield AuthenticationFailure();
    }
  }

  //AuthenticationLoggedOut
  Stream<AuthenticationState> _mapAuthenticationLoggedOutInToState() async* {
    yield AuthenticationFailure();
    _userRepository.signOut();
  }

  //AuthenticationLoggedIn
  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    final user = _userRepository.getCurrentUser();

    if (user != null) {
      yield AuthenticationSuccess(user);
    }
  }
}
