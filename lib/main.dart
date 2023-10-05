import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '/presentation/global/provider/global_bloc_provider.dart';
import '/presentation/home/home_page.dart';
import '/presentation/login/login_page.dart';
import '/core/injections/injections_container.dart' as di;
import '/theme/dark_theme.dart';
import 'presentation/global/auth_bloc/auth_bloc.dart';
import 'theme/light_theme.dart';

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
        theme: lightTheme(context),
        scaffoldMessengerKey: snackbarKey,
        darkTheme: darkTheme(context),
        themeMode: ThemeMode.system,
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
