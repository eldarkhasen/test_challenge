import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm(
      {Key? key,
      required this.userNameController,
      required this.passwordController,
      required this.emailController, required this.height})
      : super(key: key);
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return EmailValidator.validate(value)
                    ? null
                    : "Please enter a valid email";
              } else {
                return "Enter email";
              }
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
            controller: userNameController,
            decoration: const InputDecoration(
              hintText: "Username",
            ),
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
            decoration: const InputDecoration(
              hintText: "Password",
            ),
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
