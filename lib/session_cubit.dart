import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazlogin/auth/auth_credentials.dart';
import 'package:qazlogin/auth/auth_repository.dart';
import 'package:qazlogin/data_repository.dart';
import 'package:qazlogin/models/ModelProvider.dart';
import 'package:qazlogin/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  final DataRepository dataRepo;

  SessionCubit({
    @required this.authRepo,
    @required this.dataRepo,
  }) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      if (userId == null) {
        throw Exception('User not logged in');
      }
      User user = await dataRepo.getUserById(userId);
      if (user == null) {
        user = await dataRepo.createUser(
            userId: userId, username: 'User-${UUID()}');
      }

      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) async {
    // final user = dataRepo.getUser(credentials.userId);
    try {
      User user = await dataRepo.getUserById(credentials.userId);
      if (user == null) {
        user = await dataRepo.createUser(
            userId: credentials.userId,
            username: credentials.username,
            email: credentials.email);
      }
      emit(Authenticated(user: user));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
