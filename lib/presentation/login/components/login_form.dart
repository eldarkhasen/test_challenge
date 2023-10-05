import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key,
      required this.userNameController,
      required this.passwordController,
      required this.isError,
      required this.height})
      : super(key: key);
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final bool isError;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).brightness == Brightness.light
                    ? secondaryTextColor
                    : whiteColor),
            controller: userNameController,
            decoration: InputDecoration(
                hintText: "Username",
                errorText: isError ? "Invalid username" : null),
            validator: (String? value) {
              return value!.isEmpty ? "Fill out username" : null;
            },
            scrollPadding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).viewInsets.bottom + height * 0.33),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).brightness == Brightness.light
                    ? secondaryTextColor
                    : whiteColor),
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "Password",
                errorText: isError ? "Invalid password" : null),
            validator: (String? value) {
              return value!.isEmpty ? "Fill out password" : null;
            },
            scrollPadding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).viewInsets.bottom + height * 0.3),
          ),
        ],
      ),
    );
  }
}
