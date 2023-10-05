import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injections/injections_container.dart';
import '../auth_bloc/auth_bloc.dart';

class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => sl<AuthBloc>()..add(AppStarted())),
    ], child: child);
  }
}
