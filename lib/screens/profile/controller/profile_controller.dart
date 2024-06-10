import 'dart:convert';

import 'package:dacs3_1/common/entities/entities.dart';
import 'package:dacs3_1/common/utils/constants.dart';
import 'package:dacs3_1/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  UserItem build() {
    // Fetch user profile data directly within ProfileController
    final SharedPreferences _pref = Global.storageService.preferences;
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    var profileJson = jsonDecode(profile);
    var userProfile = UserItem.fromJson(profileJson);
    return userProfile;
  }
}
