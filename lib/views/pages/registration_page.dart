import 'package:flutter/material.dart';
import 'package:healthcare/const/styles.dart';
import 'package:healthcare/views/pages/login_page.dart';
import 'package:healthcare/views/widgets/button.dart';
import 'package:healthcare/views/widgets/copyright.dart';
import 'package:healthcare/views/widgets/input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _hidePassword = true;

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
                    'Silahkan registrasi untuk melanjutkan',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 245,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Input(
                          labelText: 'Nama Depan',
                          hintText: 'Masukkan nama depan anda',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Expanded(
                        child: Input(
                          labelText: 'Nama Belakang',
                          hintText: 'Masukkan nama belakang anda',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Input(
                    labelText: 'No. KTP',
                    hintText: 'Masukkan No. KTP anda',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Input(
                    labelText: 'Email',
                    hintText: 'Masukkan Email anda',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Input(
                    labelText: 'No. Telpon',
                    hintText: 'Masukkan No. Telpon anda',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Input(
                    labelText: 'Password',
                    hintText: 'Masukkan password anda',
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    hidePassword: _hidePassword,
                    onTap: () => setState(() {
                      _hidePassword = !_hidePassword;
                    }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Input(
                    labelText: 'Password',
                    hintText: 'Masukkan password anda',
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    hidePassword: _hidePassword,
                    onTap: () => setState(() {
                      _hidePassword = !_hidePassword;
                    }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Button(text: 'Register', onTap: () {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah punya akun ?',
                        style: infoStyle,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            )),
                        child: const Text(
                          'Login sekarang',
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
          ],
        ),
      ),
    );
  }
}
