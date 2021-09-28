import 'package:consumer_app/core/utlis/locator.dart';
import 'package:consumer_app/core/utlis/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login_screen.dart';
import '../widgets/widgets.dart';

import '../../../core/presentation/widgets/custom_button.dart';
import '../../../core/presentation/widgets/rounded_input_field.dart';
import 'screens.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var password = '';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30.0.h,
                          left: 40.h,
                        ),
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        //
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //
                    RoundedInputField(
                      icon: Icons.email,
                      hintText: 'Email',
                      textEditingController: _emailController,
                      validator: EmailValidator(
                        errorText: 'enter a valid email address',
                      ),
                    ),
                    //
                    RoundedInputField(
                      icon: Icons.security,
                      hintText: 'Password',
                      textEditingController: _passwordController,
                      onChanged: (val) => password = val,
                      isPassword: true,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(8,
                            errorText:
                                'password must be at least 8 digits long'),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            errorText:
                                'passwords must have at least one special character')
                      ]),
                    ),
                    //
                    RoundedInputField(
                      icon: Icons.security,
                      hintText: 'Confirm Password',
                      textEditingController: _confirmPasswordController,
                      isPassword: true,
                      validator: (val) =>
                          MatchValidator(errorText: 'passwords do not match')
                              .validateMatch(
                        val!,
                        password,
                      ),
                    ),
                    //
                    SizedBox(height: 10.h),
                    //
                    Text(
                        "Creating an account means you're okay with\nour Terms of Service and Privacy Policy",
                        style: Theme.of(context).textTheme.caption),
                    //
                    CustomButton(
                      title: 'Sign Up',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // context
                          //     .read<AuthenticationCubit>()
                          //     .signUpWithEmailAndPassword(
                          //       email: _emailController.text,
                          //       password: _passwordController.text,
                          //     );

                          // _formKey.currentState!.reset();
                        }
                      },
                    ),
                    //
                    // buildSocialLoginButton(
                    //   onPressed: () {
                    //     context.read<AuthenticationCubit>().signUpWithGoogle();
                    //   },
                    // ),
                    //
                    GestureDetector(
                      onTap: () {
                        locator
                            .get<NavigationService>()
                            .navigateToReplacement(LoginScreen.routeName);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 15.sp),
                            ),
                            TextSpan(
                              text: 'log In',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: OuterClippedPart(),
                child: Container(
                  color: const Color(0xff0962ff),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              //
              ClipPath(
                clipper: InnerClippedPart(),
                child: Container(
                  color: const Color(0xff0c2551),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
