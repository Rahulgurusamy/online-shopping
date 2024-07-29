import 'package:flutter/material.dart';
import 'package:online_shopping/pages/bottom_navigation_bar.dart';
import 'package:online_shopping/pages/login_page.dart';
import 'package:online_shopping/pages/signup_page.dart';
import 'package:online_shopping/providers/auth_provider.dart';
import 'package:online_shopping/providers/cart_provider.dart';
import 'package:online_shopping/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()..fetchProducts()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Online Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName: (ctx) => const LoginPage(),
          SignupPage.routeName: (ctx) => const SignupPage(),
          BottomNavigation.routeName: (ctx) => const BottomNavigation(),
        },
      ),
    );
  }
}
