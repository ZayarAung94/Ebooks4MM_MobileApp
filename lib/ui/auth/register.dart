import 'package:ebooks4mm/api/auth.dart';
import 'package:ebooks4mm/ui/auth/opt_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPasswd = true;
  bool isLoading = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

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
                radius: 30,
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
              const Text("Create Account! Enjoy!"),
              const SizedBox(height: 30),
              signupInput(
                icon: Icons.person_3,
                hintText: "Name",
                controller: nameController,
              ),
              signupInput(
                icon: Icons.email,
                hintText: "Email",
                controller: emailController,
              ),
              signupInput(
                icon: Icons.phone_android,
                hintText: "Phone Numbar",
                controller: phoneController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: passwdController,
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
                  final String email = emailController.text.trim();
                  final String passwd = passwdController.text.trim();
                  final String name = nameController.text.trim();
                  final String phone = phoneController.text.trim();

                  if (isLoading) {
                    setState(() {
                      isLoading = false;
                    });

                    await Auth().register(
                      email: email,
                      passwd: passwd,
                      name: name,
                      phone: phone,
                    );

                    Get.to(() => OptLogin(email: email));
                  }
                },
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: isLoading
                      ? const Text("SIGN UP")
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
                  const Text("Already have account. "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      'Login!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding signupInput({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.softBg,
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
