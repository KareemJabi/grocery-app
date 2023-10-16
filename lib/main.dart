import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'model/cart.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return cart();
    },
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "smart app",
      home: Home(),
    ),);
  }
}

