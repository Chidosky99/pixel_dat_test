abstract class AuthState {}

class AuthenticationInitialState extends AuthState {}

class AuthenticationLoadingState extends AuthState {
  final bool isLoading;

  AuthenticationLoadingState({required this.isLoading});
}

class AuthenticationSuccessState extends AuthState {
  final String message;

  AuthenticationSuccessState({required this.message});
}

class AuthenticationFailureState extends AuthState {
  final String message;

  AuthenticationFailureState({required this.message});
}

abstract class LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class LoginFailure extends LoginState {}

// Define authentication event and state

abstract class AuthenticationState {}

class Authenticated extends AuthenticationState {}

class NotAuthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
