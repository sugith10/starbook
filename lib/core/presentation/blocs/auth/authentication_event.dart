part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthSignInEvent extends AuthenticationEvent {
  final String phoneNumber;

  AuthSignInEvent({required this.phoneNumber});
}
