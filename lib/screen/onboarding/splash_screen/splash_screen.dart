import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jazenet_app/const/colors.dart';
import 'package:jazenet_app/const/styles.dart';
import 'package:jazenet_app/provider/provider.dart';
import 'package:jazenet_app/screen/home/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() async {
    Timer(const Duration(seconds: 3), () async {
      Provider.of<HomeProvider>(context,listen: false).getData(context);
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Jazenet Softdev",
          style: Styles().normalS(
            fontW: FontWeight.w900,
            fontS: 28,
            color: Colours().black,
          ),
        ),
      ),
    );
  }
}
