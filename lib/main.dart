import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qazlogin/amplifyconfiguration.dart';
import 'package:qazlogin/app_navigator.dart';
import 'package:qazlogin/auth/auth_repository.dart';
import 'package:qazlogin/data_repository.dart';
import 'package:qazlogin/loading_view.dart';
import 'package:qazlogin/session_cubit.dart';
import 'package:qazlogin/themes/app_theme.dart';

import 'models/ModelProvider.dart';
import 'translator/provider/translator_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => TranslatorData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.basic,
          home: _amplifyConfigured
              ? MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider(create: (context) => AuthRepository()),
                    RepositoryProvider(create: (context) => DataRepository()),
                  ],
                  child: BlocProvider(
                    create: (context) => SessionCubit(
                        authRepo: context.read<AuthRepository>(),
                        dataRepo: context.read<DataRepository>()),
                    child: AppNavigator(),
                  ),
                )
              : LoadingView(),
        ));
  }

  void _configureAmplify() async {
    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
      //Amplify.DataStore.clear();
    } catch (e) {
      print(e);
    }
  }
}
