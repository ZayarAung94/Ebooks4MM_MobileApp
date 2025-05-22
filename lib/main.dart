import 'package:ebooks4mm/api/user_controller.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['BASE_URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );

  final user = Supabase.instance.client.auth.currentUser;
  if (user != null) {
    await UserController().loadUser(user.id);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppData.user == null ? const LoginScreen() : MainScreen(),
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: AppData.mmFont,
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: AppData.mmFont,
            ),
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
