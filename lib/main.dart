import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_webingo/Screen%201/view_models/plan_view_model.dart';
import 'package:task_webingo/Screen%201/views/home_screen.dart';
import 'package:task_webingo/Screen%202/view_models/bottom_nav_view_model,dart';
import 'package:task_webingo/Screen%202/view_models/travel_view_model.dart';
import 'package:task_webingo/Screen%202/views/travel_screen.dart';
import 'package:task_webingo/Screen%203/views/choose_seats_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TravelViewModel()),
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
         ChangeNotifierProvider(
      create: (context) => PlanProvider())
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const HomeScreen(),
        home: TravelScreen(),
   
      ), );
  }
}
