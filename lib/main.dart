import 'dart:math';

import 'package:animation_builder/card_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CardHiddenAnimationPage(),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5)
    )..repeat();

    animation = Tween<double>(begin: 0,end: pi*2).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) =>
            Transform.rotate(angle: animation.value,child: child,),
        child: Center(
          child: Container(
            color: Colors.redAccent,
            height: 200,
            width: 200,
          ),
        ),
      ),
    ));
  }
}
