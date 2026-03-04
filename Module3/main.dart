import 'package:flutter/material.dart';
import 'package:flutter_assignments/02.dart';
import 'package:flutter_assignments/22/Settings.dart';
import 'package:flutter_assignments/38/product_list.dart';
import 'package:provider/provider.dart';

import '01.dart';
import '03.dart';
import '04.dart';
import '05.dart';
import '06.dart';
import '07.dart';
import '08.dart';
import '09.dart';
import '10.dart';
import '11.dart';
import '12.dart';
import '13.dart';
import '14.dart';
import '15.dart';
import '16.dart';
import '17.dart';
import '18.dart';
import '19.dart';
import '20.dart';
import '21/First.dart';
import '22/Details.dart';
import '22/Home.dart';
import '23/Home.dart';
import '24.dart';
import '25.dart';
import '26.dart';
import '27.dart';
import '28.dart';
import '29.dart';
import '30.dart';
import '31.dart';
import '32.dart';
import '33.dart';
import '34.dart';
import '35.dart';
import '36/FirstPage.dart';
import '37/Home.dart';
import '37/counter_provider.dart';
import '38/cart_provider.dart';
import '39/home_screen.dart';
import '39/theme_provider.dart';
import '40/auth_provider.dart';
import '40/homescreen.dart';
import '41.dart';
import '42/progressbardemo.dart';
import '43.dart';
import '44/profile_screen.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => CounterProvider(),
    //   child: const MyApp(),
    // ),
    // ChangeNotifierProvider(
    //   create: (context) => CartProvider(),
    //   child: const MyApp(),
    // ),
    // ChangeNotifierProvider(
    //   create: (context) => ThemeProvider(),
    //   child: const MyApp(),
    // ),
    // ChangeNotifierProvider(
    //   create: (_) => AuthProvider(),
    //   child: const MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      // themeMode: themeProvider.themeMode,
      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Profile Card Example")),
      //   body: Center(
      //     child: ProfileCard(
      //       name: "Hetvi Gusani",
      //       image: 'assets/img.png', // sample avatar URL
      //       bio: "Flutter developer, coffee lover, and tech enthusiast.",
      //     ),
      //   ),
      // ),
      home: ProfileScreen(),
    );

    // return Consumer<AuthProvider>(
    //   builder: (context, auth, child) {
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: auth.isLoggedIn
    //           ? const HomeScreen()
    //           : const LoginScreen(),
    //     );
    //   },
    // );
  }
}
