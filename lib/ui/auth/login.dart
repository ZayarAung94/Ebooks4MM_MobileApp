import 'package:ebooks4mm/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'forget_passwd.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  bool showPasswd = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity, height: 100),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/logo.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                "EBooks 4MM",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Welcome Back! And Enjoy!"),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _passwdController,
                  obscureText: showPasswd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPasswd = !showPasswd;
                        });
                      },
                      child: Icon(
                        showPasswd ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[600],
                      ),
                    ),
                    hintText: "Password",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  setState(() {
                    isLoading = false;
                  });

                  Future.delayed(Duration(seconds: 2), () {
                    Get.offAll(() => MainScreen());
                  });
                },
                color: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: isLoading
                      ? const Text("LOGIN")
                      : const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Created Account. "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: const Text(
                      'Sign up!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ForgetpasswdScreen());
                },
                child: const Text(
                  'Forget Password!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
