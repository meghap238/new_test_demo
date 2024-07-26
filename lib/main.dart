import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/bloc/employ_bloc.dart';
import 'package:new_test/posts_screen.dart';
import 'package:new_test/repository_one.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'employe_screen.dart';
import 'login_page.dart';

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
      // home: PostsScreen(),
      home: PostsScreen(),
      // home: BlocProvider(
      //     create: (BuildContext context)  => EmployBloc(ApiIntegrationProvider()),
      // child: LoginPage())
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
