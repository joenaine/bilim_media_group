import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazlogin/auth/auth_cubit.dart';
import 'package:qazlogin/auth/auth_navigator.dart';
import 'package:qazlogin/loading_view.dart';
import 'package:qazlogin/pages/profile.dart';
import 'package:qazlogin/pages/profile1.dart';
import 'package:qazlogin/session_cubit.dart';
import 'package:qazlogin/session_state.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show loading screen
          if (state is UnknownSessionState) MaterialPage(child: LoadingView()),

          // Show auth flow
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: AuthNavigator(),
              ),
            ),

          // Show session flow
          if (state is Authenticated) MaterialPage(child: ProfilePage1())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
