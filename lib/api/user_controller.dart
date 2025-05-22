import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ebooks4mm/models/profile/profile.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/widgets/messages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController {
  final userTb = Supabase.instance.client.from("users");

  Future create(Profile user) async {
    String device = "";
    // String deviceSN = "";
    if (Platform.isAndroid) {
      final result = await DeviceInfoPlugin().androidInfo;
      device = result.model;
      // deviceSN = result.id;
    } else if (Platform.isIOS) {}

    user.device = device;

    try {
      await userTb.insert(user.toJson());

      AppData.user = user;
    } catch (e) {
      AppMessage.error("Something is wrong on created account!");
    }
  }

  Future<Profile?> loadUser(String id) async {
    try {
      final result = await userTb.select().eq("id", id).single();
      AppData.user = Profile.fromJson(result);
    } catch (e) {
      AppMessage.error('Something is wrong on your account. Contact to Customer Support!');
    }

    return AppData.user;
  }
}
