import 'package:flutter/material.dart';
import 'package:mountain_app/Provider.dart';
import 'package:mountain_app/pages/PageOfBookTrib.dart';
import 'package:mountain_app/pages/PageOfWelcome.dart';
import 'package:provider/provider.dart';

import 'pages/PagesOfBottomNav/PageOfMainNav.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: PageOfWelcome.id,
      routes: {
        PageOfWelcome.id: (context) => PageOfWelcome(),
        PageOfMainNav.id: (context) => PageOfMainNav(),
        PageOfBookTrib.id: (context) => PageOfBookTrib(),
      },
    );
  }
}
