import 'package:flutter/material.dart';
import 'package:jazenet_app/screen/home/home_screen/home_screen.dart';

Map<String, WidgetBuilder> routes (){
  return {
    HomeScreen.routeName: (ctx) =>  const HomeScreen(),
  };
}