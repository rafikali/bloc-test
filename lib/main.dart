import 'package:bloctest/features/home/views/home_view.dart';
import 'package:bloctest/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/bloc/fetchuser_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(BlocProvider(
    create: (context) => FetchuserBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "bloctest",
      home: HomePage(),
    );
  }
}
