import 'package:api_bloc/screen/home.dart';
import 'package:api_bloc/services/bored_services.dart';
import 'package:api_bloc/services/connectivityservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiRepositoryProvider(providers: [
          RepositoryProvider(create: (context) => BoredServices()),
          RepositoryProvider(create: (context) => ConnectivityService())
        ], child: const HomePage()));
  }
}
