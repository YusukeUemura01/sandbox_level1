import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox_level1/screens/login_page.dart';

import 'package:sandbox_level1/screens/navigation_page.dart';







void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  final token = await messaging.getToken();
  print('🐯 FCM TOKEN: $token');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.orange,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 28, 57),
        primaryColor: const Color.fromARGB(255, 255, 45, 136),
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // サインイン済みのホーム画面へ
            return const NavigationPage();
          }
          // 未サインインのサインイン画面へ
          return const LoginPage();
        },
      ),
    );
  }
}


