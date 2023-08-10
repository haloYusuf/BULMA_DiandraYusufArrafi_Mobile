import 'package:flutter/material.dart';
import 'package:project_akhir_seleksi_itc/models/login_data.dart';
import 'package:project_akhir_seleksi_itc/pages/home/home_view.dart';
import 'package:project_akhir_seleksi_itc/pages/login/login_view.dart';
import 'package:project_akhir_seleksi_itc/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BULMA',
      initialRoute: RouteNames.login,
      routes: {
        RouteNames.login : (context) => LoginData.isLogin ? const HomeView() : const LoginView(),
        RouteNames.home : (context) => LoginData.isLogin ? const HomeView() : const LoginView(),
      },
    );
  }
}
