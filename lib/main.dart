import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_app/providers/authentication/email_verify_provider.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:learning_english_app/firebase_options.dart';
import 'package:learning_english_app/providers/authentication/signin_provider.dart';
import 'package:learning_english_app/screens/authentication/signin_screen.dart';
import 'package:learning_english_app/providers/authentication/signup_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider()),
        ChangeNotifierProvider<SignUpProvider>(
            create: (context) => SignUpProvider()),
        ChangeNotifierProvider<EmailVerifyProvider>(
            create: (context) => EmailVerifyProvider()),
        ChangeNotifierProvider<PageQuizProvider>(
            create: (context) => PageQuizProvider())
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            fontFamily: 'Roboto',
            primarySwatch: Colors.blue,
          ),
          home: SignInScreen(),
          routes: <String, WidgetBuilder>{
            '/signin': (BuildContext context) => SignInScreen(),
          }),
    );
  }
}
