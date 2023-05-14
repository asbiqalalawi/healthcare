import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/cubit/filter_cubit.dart';
import 'package:healthcare/cubit/login_cubit.dart';
import 'package:healthcare/views/pages/home_page.dart';
import 'package:healthcare/views/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  runApp(MyApp(
    isLogin: token != null ? true : false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});

  final bool isLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => FilterCubit()),
      ],
      child: MaterialApp(
        title: 'Healthcare App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          fontFamily: 'Gilroy',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: isLogin ? const HomePage() : const LoginPage(),
      ),
    );
  }
}
