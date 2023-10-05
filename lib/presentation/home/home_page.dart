import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/auth_bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("HOME PAGE"),
          ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LoggedOut());
              },
              child: const Text("LOGOUT"))
        ],
      )),
    );
  }
}
