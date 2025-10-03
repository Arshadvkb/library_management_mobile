import 'package:flutter/material.dart';
import 'package:library_management_mobile/app/home/home_view.dart';
import 'package:library_management_mobile/app/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library management',
     
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomeView(),
        '/login':(context)=>const LoginView()
      }
    );
  }
}
