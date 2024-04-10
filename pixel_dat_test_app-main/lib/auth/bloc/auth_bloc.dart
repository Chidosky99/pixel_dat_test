import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_dat_test_app/auth/bloc/auth_event.dart';
import 'package:pixel_dat_test_app/auth/bloc/auth_state.dart';
import 'package:pixel_dat_test_app/network/api_endpoints.dart';
import 'package:pixel_dat_test_app/utils/api_endpoints_config.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthenticationInitialState()) {
    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final response = await http.post(
          Uri.parse(authEndpoints.registerCustomer),
          body: {
            'name': event.name,
            'email': event.email,
            'password': event.password,
          },
        );

        if (response.statusCode == 200) {
          emit(AuthenticationSuccessState(
              message: 'User registered successfully'));
        } else {
          emit(AuthenticationFailureState(message: 'Failed to register user'));
        }
      } catch (e) {
        emit(AuthenticationFailureState(message: 'An error occurred'));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      // Implement sign-out logic here
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}

// Define LoginBloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoading());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AttemptLogin) {
      yield LoginLoading();
      try {
        final response = await http.post(
          Uri.parse(
            authEndpoints.login,
          ),
          body: {'username': event.username, 'password': event.password},
        );
        final data = jsonDecode(response.body);
        final token = data['token'];
        if (token != null) {
          yield LoginSuccess(token: token);
        } else {
          yield LoginFailure();
        }
      } catch (e) {
        yield LoginFailure();
      }
    }
  }
}

// Define AuthenticationBloc
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationLoading());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckAuthentication) {
      yield AuthenticationLoading();
      try {
        final response = await http.get(
          Uri.parse(
            authEndpoints.authUser,
          ),
          headers: {'Authorization': 'Bearer ${event.token}'},
        );
        final data = jsonDecode(response.body);
        if (data['authenticated'] == true) {
          yield Authenticated();
        } else {
          yield NotAuthenticated();
        }
      } catch (e) {
        yield NotAuthenticated();
      }
    }
  }
}
