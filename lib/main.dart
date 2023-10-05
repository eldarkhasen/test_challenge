import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_challenge/presentation/global/auth_bloc/auth_bloc.dart';
import 'package:test_challenge/presentation/global/provider/global_bloc_provider.dart';
import 'package:test_challenge/presentation/home/home_page.dart';
import 'package:test_challenge/presentation/login/login_page.dart';
import 'package:test_challenge/core/injections/injections_container.dart' as di;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await GetIt.instance.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Test Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GlobalBlocProvider(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authorized) {
                return const HomePage();
              } else if (state is Unauthorized) {
                return const LoginPage();
              }
              return Container();
            },
          ),
        ));
  }
}
