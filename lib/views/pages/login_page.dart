import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';
import 'package:healthcare/cubit/login_cubit.dart';
import 'package:healthcare/views/pages/home_page.dart';
import 'package:healthcare/views/pages/registration_page.dart';
import 'package:healthcare/views/widgets/button.dart';
import 'package:healthcare/views/widgets/copyright.dart';
import 'package:healthcare/views/widgets/input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  bool _isLoading = false;

  _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        await context.read<LoginCubit>().login(
              _emailController.text,
              _passwordController.text,
            );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            duration: const Duration(seconds: 1),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 159,
                  ),
                  Image.asset(
                    'assets/png/auth_illustration.png',
                    height: 258,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Hai,',
                          style: welcomeStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' Selamat Datang',
                          style: welcomeStyle.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ]),
                    ),
                    const Text(
                      'Silahkan login untuk melanjutkan',
                      style: subtitleStyle,
                    ),
                    const SizedBox(
                      height: 225,
                    ),
                    Input(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'Masukkan email anda',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email harus diisi';
                        } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Format email salah';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Input(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Masukkan password anda',
                      isPassword: true,
                      forgotPassword: true,
                      hidePassword: _hidePassword,
                      onTap: () => setState(() {
                        _hidePassword = !_hidePassword;
                      }),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password harus diisi';
                        } else if (value.length < 6) {
                          return 'Password harus lebih dari 6 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                            ),
                          );
                        } else if (state is LoginSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                      child: Button(text: 'Login', onTap: () => !_isLoading ? _login() : null),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Belum punya akun ?',
                          style: infoStyle,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              )),
                          child: const Text(
                            'Daftar sekarang',
                            style: linkStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CopyRight(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            _isLoading
                ? Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: primaryColor,
                        rightDotColor: blue9D5,
                        size: 100,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
