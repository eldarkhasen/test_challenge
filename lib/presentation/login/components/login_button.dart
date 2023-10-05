import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.selectedButton,
      required this.onLogin,
      required this.onSignUp,
      required this.isLoading})
      : super(key: key);
  final int selectedButton;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Color buttonColor(bool isActive) {
      if (Theme.of(context).brightness == Brightness.light) {
        if (isActive) {
          return whiteColor;
        } else {
          return secondaryTextColor;
        }
      } else {
        return whiteColor;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Container background color
          ),
          child: isLoading
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Center(
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  ))
              : IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () => onLogin(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                color: selectedButton == 0
                                    ? primaryColor
                                    : Colors.transparent),
                            child: Center(
                                child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: buttonColor(selectedButton == 0)),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () => onSignUp(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                color: selectedButton == 1
                                    ? primaryColor
                                    : Colors.transparent),
                            child: Center(
                                child: Text(
                              "Sign-up",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: buttonColor(selectedButton == 1)),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
