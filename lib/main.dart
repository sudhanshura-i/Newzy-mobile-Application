import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_app/detail.dart';
import 'package:result_app/pages/home.dart';
import 'package:result_app/pages/news_notifier.dart';
import 'pages/student_login.dart';
import 'pages/login_options.dart';
import 'pages/feed.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => NewsNotifier()),
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => LoginOptions(),
      '/student_login': (context) => StudentLogin(),
      '/feed': (context) => Feed(),
      '/home': (context) => Newsform(),
    });
  }
}
