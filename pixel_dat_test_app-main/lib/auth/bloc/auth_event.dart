abstract class AuthEvent {}

class SignUpUser extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpUser({required this.name, required this.email, required this.password});
}

class SignOut extends AuthEvent {}

abstract class LoginEvent {}

class AttemptLogin extends LoginEvent {
  final String username;
  final String password;

  AttemptLogin({required this.username, required this.password});
}

abstract class AuthenticationEvent {}

class CheckAuthentication extends AuthenticationEvent {
  final String token;

  CheckAuthentication({required this.token});
}
