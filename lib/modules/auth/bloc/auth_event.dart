part of 'auth_bloc.dart';
abstract class AuthEvent {}

final class AuthLogin extends AuthEvent{
  final String email;
  final String password;
  AuthLogin({required this.email,required this.password});
}


final class AuthLogout extends AuthEvent{}