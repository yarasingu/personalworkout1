// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:personalworkout/firebase_options.dart';
// import 'package:personalworkout/pages/home_page.dart';
// // import 'package:personalworkout/services/auth/auth_gate.dart';
// import 'package:personalworkout/themes/theme_provider.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   // firebase setup
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(ChangeNotifierProvider(
//     create: (context) => ThemeProvider(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: const AuthGate(),
//       home: HomePage(),
//       theme: Provider.of<ThemeProvider>(context).themeData,
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personalworkout/charts/ChartPage.dart';
import 'package:personalworkout/firebase_options.dart';
import 'package:personalworkout/pages/WorkoutListPage.dart';
import 'package:personalworkout/pages/home_page.dart';

import 'package:personalworkout/services/WorkoutService.dart';

import 'package:personalworkout/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/workoutList': (context) => WorkoutListPage(),
        '/chart': (context) => ChartPage(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
