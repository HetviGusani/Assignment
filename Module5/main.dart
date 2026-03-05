import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:module5/2/product_list.dart';
import 'package:provider/provider.dart';

import '1.dart';
import '2/cart_provider.dart';
import '3/ui.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => CartProvider(),
    //   child: const MyApp(),
    // ),);
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: increDecre(),
      home: TodoScreen(),
    );
  }
}
