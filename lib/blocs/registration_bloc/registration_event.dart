part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  RegistrationEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  RegistrationPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RegistrationSubmitted extends RegistrationEvent {
  final String email;
  final String password;

  RegistrationSubmitted({required this.email, required this.password});

    @override
  List<Object> get props => [email, password];
}
