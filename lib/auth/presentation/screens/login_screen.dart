import '../../logic/auth_cubit/auth_cubit.dart';
import 'screens.dart';
import '../widgets/widgets.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../../../core/utlis/failure.dart';
import '../../../core/utlis/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../core/utlis/navigation_service.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (failure) => Failure.handleError(context, failure),
            orElse: () {},
          );
        },
        child: SingleChildScrollView(
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
                        padding: EdgeInsets.only(left: 40.0.h, top: 40.h),
                        child: Text(
                          'Log In',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        //
                      ),
                    ),
                    //
                    SizedBox(height: 30.h),
                    //
                    RoundedInputField(
                      textEditingController: _emailController,
                      icon: Icons.email,
                      hintText: 'Email',
                      validator: MultiValidator([
                        EmailValidator(
                          errorText: 'enter a valid email address',
                        ),
                        RequiredValidator(errorText: 'password is required'),
                      ]),
                    ),
                    //
                    RoundedInputField(
                      icon: Icons.security,
                      hintText: 'Password',
                      textEditingController: _passwordController,
                      isPassword: true,
                      validator:
                          RequiredValidator(errorText: 'password is required'),
                    ),
                    //
                    SizedBox(height: 10.h),
                    //
                    authState.maybeWhen(
                      loading: () => const CustomButton(
                        title: 'Logging in',
                        isLoading: true,
                      ),
                      orElse: () => CustomButton(
                        title: 'Log In',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthCubit>()
                                .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                            _formKey.currentState?.reset();
                          }
                        },
                      ),
                    ),

                    //
                    GestureDetector(
                      onTap: () {
                        locator
                            .get<NavigationService>()
                            .navigateToReplacement(SignUpScreen.routeName);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'New to Yolo ? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontSize: 15.sp),
                            ),
                            TextSpan(
                              text: 'Sign Up',
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
                  color: Theme.of(context).primaryColor,
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
