import 'dart:async';

import 'package:ebooks4mm/api/auth.dart';
import 'package:ebooks4mm/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class OptLogin extends StatefulWidget {
  final String email;
  const OptLogin({super.key, required this.email});

  @override
  State<OptLogin> createState() => _OptLoginState();
}

class _OptLoginState extends State<OptLogin> {
  final TextEditingController _emailController = TextEditingController();

  bool showPasswd = true;
  bool isLoading = true;

  int _seconds = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              const SizedBox(height: 10),
              Text(
                "OTP Verification!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We've send you the verification code on",
                textAlign: TextAlign.center,
              ),
              Text(
                widget.email,
                style: TextStyle(color: Colors.blue.shade400),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _emailController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    hintText: "OPT Code",
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  if (isLoading = true) {
                    setState(() {
                      isLoading = false;
                    });

                    final res = await Auth().optLogin(
                      _emailController.text.trim(),
                      widget.email,
                    );

                    if (res) {
                      Get.offAll(() => MainScreen());
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                    }
                  }
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
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => const SignupScreen());
                    },
                    child: const Text(
                      'Re-send code',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(" in $_seconds s!"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
