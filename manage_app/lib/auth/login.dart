import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_app/auth/component/dialog/loading_dialog.dart';
import 'package:manage_app/core/theme/app_color.dart';
import 'package:manage_app/main/homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String validEmail = "admin@gmail.com";
  String validPassword = "123456";

  bool _validateUsername = false;
  bool _validatePass = false;

  bool _isCorrectAccount = true;

  /// input form controller
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  StateMachineController? controller;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  void login() {
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD6E2EA),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.h),
          child: Column(
            children: [
              SizedBox(height: 32.h),
              Text(
                "Manage App Login",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 250.h,
                width: 250.w,
                child: RiveAnimation.asset(
                  'assets/riv/login-teddy.riv',
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["Login Machine"],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                      artboard,
                      "Login Machine",
                    );
                    if (controller == null) return;

                    artboard.addController(controller!);
                    isChecking = controller?.findInput("isChecking");
                    numLook = controller?.findInput("numLook");
                    isHandsUp = controller?.findInput("isHandsUp");
                    trigSuccess = controller?.findInput("trigSuccess");
                    trigFail = controller?.findInput("trigFail");
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: TextField(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorText: _validateUsername
                              ? "Không được để trống !"
                              : null,
                          hintText: "Email",
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (value) {
                          numLook?.change(value.length.toDouble());
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: TextField(
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorText:
                              _validatePass ? "Không được để trống !" : null,
                          hintText: "Password",
                        ),
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 12.h),
                    !_isCorrectAccount
                        ? Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sai tên đăng nhập hoặc mật khẩu !',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.red),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            emailController.text.isEmpty
                                ? _validateUsername = true
                                : _validateUsername = false;

                            passwordController.text.isEmpty
                                ? _validatePass = true
                                : _validatePass = false;
                          });

                          emailFocusNode.unfocus();
                          passwordFocusNode.unfocus();

                          if (!_validatePass && !_validateUsername) {
                            final email = emailController.text;
                            final password = passwordController.text;

                            showLoadingDialog(context);
                            await Future.delayed(
                              const Duration(milliseconds: 2000),
                            );
                            if (mounted) Navigator.pop(context);

                            if (email == validEmail &&
                                password == validPassword) {
                              trigSuccess?.change(true);
                              setState(() {
                                _isCorrectAccount = true;
                              });
                              login();
                            } else {
                              trigFail?.change(true);
                              setState(() {
                                _isCorrectAccount = false;
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180.h,
              ),
              Text(
                'Created by PhuocHoang',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
