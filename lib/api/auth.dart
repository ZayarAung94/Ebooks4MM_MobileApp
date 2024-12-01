import 'package:ebooks4mm/api/user_controller.dart';
import 'package:ebooks4mm/models/profile/profile.dart';
import 'package:ebooks4mm/ui/auth/opt_login.dart';
import 'package:ebooks4mm/ui/widgets/messages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  final _client = Supabase.instance.client;
  final _userController = UserController();

  Future<bool> login({required String email, required String passwd}) async {
    try {
      final res = await _client.auth.signInWithPassword(
        email: email,
        password: passwd,
      );

      await UserController().loadUser(res.user!.id);

      return true;
    } on AuthException catch (e) {
      if (e.message == "Email not confirmed") {
        AppMessage.error("${e.message} \nCheck your email and confirm first.");
        try {
          await _client.auth.resend(
            type: OtpType.signup,
            email: email,
          );

          Get.to(() => OptLogin(email: email));
        } on AuthException catch (e) {
          AppMessage.error(e.message);
        }
      } else {
        AppMessage.error(e.message);
      }
      return false;
    }
  }

  Future logout() async {
    await _client.auth.signOut();
  }

  Future register({
    required String email,
    required String passwd,
    required String name,
    required String phone,
  }) async {
    try {
      final res = await _client.auth.signUp(
        email: email,
        password: passwd,
      );

      Profile user = Profile(
        id: res.user!.id,
        name: name,
        phone: phone,
        email: email,
      );

      await _userController.create(user);
    } on AuthException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<bool> optLogin(String token, String email) async {
    try {
      await _client.auth.verifyOTP(
        type: OtpType.signup,
        token: token,
        email: email,
      );

      return true;
    } on AuthException catch (e) {
      AppMessage.error(e.message);
      return false;
    }
  }

  Future forgetPassword() async {}
}
