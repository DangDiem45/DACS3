import 'dart:convert';

import 'package:dacs3_1/common/entities/entities.dart';
import 'package:dacs3_1/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService> init() async{
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async{
    return await _pref.setString(key, value);
  }

  String getUserToken(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }
  // Add this getter
  SharedPreferences get preferences => _pref;

  Future<bool> remove(String key) async{
    return await _pref.remove(key);
  }
}