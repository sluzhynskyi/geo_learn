import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geo_learn/repositories/user_repository.dart';
import 'package:geo_learn/utils/validators.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository _userRepository;

  RegistrationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegistrationState.initial());

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegistrationEmailChanged) {
      yield* _mapRegistrationEmailChangeToState(event.email);
    } else if (event is RegistrationPasswordChanged) {
      yield* _mapRegistrationPasswordChangeToState(event.password);
    } else if (event is RegistrationSubmitted) {
      yield* _mapRegistrationSubmittedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<RegistrationState> _mapRegistrationEmailChangeToState(
      String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegistrationState> _mapRegistrationPasswordChangeToState(
      String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegistrationState> _mapRegistrationSubmittedToState(
      {required String email, required String password}) async* {
    yield RegistrationState.loading();
    try {
      await _userRepository.signUp(email, password);
      yield RegistrationState.success();
    } catch (error) {
      print(error);
      yield RegistrationState.failure();
    }
  }
}
