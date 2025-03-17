import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_gym_project_altamash/screens/firebase_repo.dart';
import 'package:health_gym_project_altamash/screens/splash_screen.dart';
import 'package:health_gym_project_altamash/screens/userInfo/UserData_bloc/Userbloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  // Initialize Hive
  await Hive.initFlutter();

  // Open the box for storing weight data
  var ne = await Hive.openBox<Map<dynamic, dynamic>>('weights2');
  var ne1 = await Hive.openBox<Map<dynamic, dynamic>>('exercisehistory');
  var ne2 = await Hive.openBox<String>('username');
  var ne3 = await Hive.openBox('days');

  var workoutduration = await Hive.openBox("workouttime");
  await Hive.openBox("newdays");
  await Hive.openBox("userProfile");
  await Hive.openBox("restduration");
  await Hive.openBox("guideduration");
  await Hive.openBox("exerciseduration");

  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (context) =>
        //         FavouritesBloc(dbHelper: DBHelper.getinstance())),
        // BlocProvider(
        //     create: (context) => HistoryBloc(dbHelper: DBHelper.getinstance())),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc(userRepository: UserRepository())),
      ],
      child: MyApp(),
    ),
    // MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Akshar",
        scaffoldBackgroundColor: Colors.white, // Set white background globally
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Set your desired color
          ),
        ),
      ),
      home: NewSplashPage(),
    );
  }
}
