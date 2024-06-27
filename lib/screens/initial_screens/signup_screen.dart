import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/core/utils/validator.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/use_cases/signup_user_use_case.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import 'package:surge_seven/features/user/presentation/user_provider.dart';
import 'package:surge_seven/screens/client_screens/client_home_screen.dart';
import 'package:surge_seven/widgets/components/green_card.dart';
import 'package:surge_seven/widgets/components/my_button.dart';
import 'package:surge_seven/widgets/my_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String userType = 'Client';

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: const Offset(0, 30),
                  child: Image.asset('assets/images/png/logo.png',
                      height: screenUtil.height * 0.18),
                ),
                GreenCard(
                  height: screenUtil.height * 0.74,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: titleTextStyle.copyWith(
                            color: AppColors.textColorLight,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Enter your email & password to sign up',
                          style: smallTextStyle.copyWith(
                            color: AppColors.textColorLight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          controller: emailController,
                          hintText: 'me@example.com',
                          label: 'Email',
                        ),
                        MyTextField(
                          controller: passwordController,
                          hintText: 'password',
                          label: 'Password',
                          isPassword: true,
                        ),
                        MyTextField(
                          controller: confirmPasswordController,
                          hintText: 'confirm password',
                          label: 'Confirm Password',
                          isPassword: true,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Sign up as a:',
                          style: formLabelStyle.copyWith(
                            color: AppColors.textColorLight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userType = 'Client';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: screenUtil.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: userType == 'Client'
                                      ? AppColors.textColorDark.withOpacity(0.5)
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Client',
                                    style: formLabelStyle.copyWith(
                                      color: AppColors.textColorLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userType = 'Truck Owner';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: screenUtil.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: userType == 'Truck Owner'
                                      ? AppColors.textColorDark.withOpacity(0.5)
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Truck Owner',
                                    style: formLabelStyle.copyWith(
                                      color: AppColors.textColorLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        MyButton(
                            label: 'Sign Up',
                            onPressed: _handleSignupValidation),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: smallTextStyle.copyWith(
                                color: AppColors.textColorLight,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                '  Login Now',
                                style: formLabelStyle.copyWith(
                                  color: AppColors.textColorLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  _handleSignupValidation() {
    //validate fields
    if (emailController.text.isEmpty) {
      showToast('Email is required');
      return;
    } else if (passwordController.text.isEmpty) {
      showToast('Password is required');
      return;
    } else if (confirmPasswordController.text.isEmpty) {
      showToast('Confirm Password is required');
      return;
    } else if (passwordController.text.length < 5) {
      showToast('Password must be at least 5 characters');
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      showToast('Passwords do not match');
      return;
    } else {
      if (Validator.isEmail(emailController.text)) {
        _signUp();
      } else {
        showToast('Invalid email address');
      }
    }
  }

  _signUp() async {
    final userProvider = getIt<UserProvider>();

    UserEntity userEntity = UserEntity(
      email: emailController.text,
      password: passwordController.text,
      userType: userType,
      dateRegistered: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );

    final signUpUserUseCase = getIt<SignUpUserUseCase>();
    showProgress('Signing up...');
    final user = await signUpUserUseCase.call(userEntity);
    user.fold((error) {
      showError('User Signup failed: ${error.message}');
    }, (user) {
      userProvider.setCurrentUser(user);
      showToast('Signup successful...');
      navigateToHome(context, user);
    });
  }
}
