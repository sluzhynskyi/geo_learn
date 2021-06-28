part of 'registration_bloc.dart';

class RegistrationState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool doPasswordsMatch;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  RegistrationState(
      {required this.isEmailValid,
      required this.isPasswordValid,
      required this.doPasswordsMatch,
      required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure});

  factory RegistrationState.initial() {
    return RegistrationState(
      isEmailValid: true,
      isPasswordValid: true,
      doPasswordsMatch: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegistrationState.loading() {
    return RegistrationState(
      isEmailValid: true,
      isPasswordValid: true,
      doPasswordsMatch: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegistrationState.failure() {
    return RegistrationState(
      isEmailValid: true,
      isPasswordValid: true,
      doPasswordsMatch: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory RegistrationState.success() {
    return RegistrationState(
      isEmailValid: true,
      isPasswordValid: true,
            doPasswordsMatch: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegistrationState update({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? doPasswordMatch
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      doPasswordsMatch: doPasswordMatch,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegistrationState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? doPasswordsMatch,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return RegistrationState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      doPasswordsMatch: doPasswordsMatch?? this.doPasswordsMatch,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
