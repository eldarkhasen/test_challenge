import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_clip_path.dart';
import 'components/login_button.dart';
import '/core/utils/alert.dart';
import '/presentation/global/auth_bloc/auth_bloc.dart';
import '/presentation/login/bloc/login_bloc.dart';
import '/presentation/login/components/login_form.dart';
import '/presentation/login/components/sign_up_form.dart';
import '/theme/constants.dart';

import '../../core/injections/injections_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isKeyboardVisible = false;
  late StreamSubscription<bool> keyBoardSubscription;
  int selectedButton = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
      emailController.text = "";
      passwordController.text = "";
      userNameController.text = "";
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    pageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  PageController pageController = PageController();

  @override
  void initState() {
    keyBoardSubscription =
        KeyboardVisibilityController().onChange.listen((isVisible) {
      isKeyboardVisible = isVisible;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? whiteColor
            : blackColor,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is SuccessLogin) {
              context.read<AuthBloc>().add(LoggedIn());
            } else if (state is UserNotFound) {
              Alert.warning(message: "Invalid credentials");
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: isKeyboardVisible
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom +
                        height * 0.1),
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? secondaryColor
                                    : secondaryColorDark),
                        height: height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 72, horizontal: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/icons/Logo.svg")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).brightness == Brightness.light
                          ? whiteColor
                          : blackColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.4,
                            child: Form(
                              key: _formKey,
                              child: PageView(
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index) {
                                  selectButton(index);
                                },
                                children: [
                                  LoginForm(
                                      userNameController: userNameController,
                                      passwordController: passwordController,
                                      isError: state is UserNotFound,
                                      height: height),
                                  SignUpForm(
                                      userNameController: userNameController,
                                      passwordController: passwordController,
                                      emailController: emailController,
                                      height: height)
                                ],
                              ),
                            ),
                          ),
                          LoginButton(
                              selectedButton: selectedButton,
                              onLogin: () {
                                if (selectedButton == 0) {
                                  if (validateForm()) {
                                    context.read<LoginBloc>().add(Login(
                                        userNameController.text,
                                        passwordController.text));
                                  }
                                } else {
                                  pageController.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                  selectButton(0);
                                }
                              },
                              onSignUp: () {
                                if (selectedButton == 1) {
                                  if (validateForm()) {
                                    context.read<LoginBloc>().add(SignUp(
                                        emailController.text,
                                        userNameController.text,
                                        passwordController.text));
                                  }
                                } else {
                                  pageController.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                  selectButton(1);
                                }
                              },
                              isLoading: state is LoadingLogin),
                          const SizedBox(
                            height: 32,
                          ),
                          TextButton(
                            onPressed: () {
                              Alert.warning(message: "Coming soon");
                            },
                            child: Text(
                              "Forgot password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? primaryColor
                                          : whiteColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool validateForm() {
    if (isKeyboardVisible) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.requestFocus(FocusNode());
      }
    }
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
