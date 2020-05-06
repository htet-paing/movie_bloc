import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_bloc/auth/authenticationBloc/authentication_bloc.dart';
import 'package:movie_bloc/auth/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc ({
    @required this.userRepository,
    @required this.authenticationBloc
  }) : assert (userRepository != null),
      assert (authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await userRepository.authenticate(userName: event.userName, password: event.password);
        authenticationBloc.add(LoggedIn(token: token));

      }catch (error){
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
