import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKeys {
  notificationToken("notificationToken"),
  uid("uid"),
  userName("user_name");

  final String value;
  const SharedPreferenceKeys(this.value);
}

class CustomSharedPreference {
  Future<bool> storeData(
      {required SharedPreferenceKeys key, required String data}) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return await sharedPref.setString(key.value, data);
    } catch (e) {
      return false;
    }
  }

  Future<String?> getData({required SharedPreferenceKeys key}) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(key.value);
  }

  Future<bool> deleteData({required SharedPreferenceKeys key}) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return await sharedPref.remove(key.value);
    } catch (e) {
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return await sharedPref.clear();
    } catch (e) {
      return false;
    }
  }

  Future<bool> storeListData(
      {required SharedPreferenceKeys key, required List<String> data}) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return await sharedPref.setStringList(key.value, data);
    } catch (e) {
      return false;
    }
  }

  Future<List<String>?> getListData({required SharedPreferenceKeys key}) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList(key.value);
  }

  Future<bool> addToList(
      {required SharedPreferenceKeys key, required String item}) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      List<String>? currentList = sharedPref.getStringList(key.value);

      // リストがnullなら新しいリストを作成します
      currentList ??= [];

      // アイテムをリストに追加します
      currentList.add(item);

      // 更新されたリストを保存します
      return await sharedPref.setStringList(key.value, currentList);
    } catch (e) {
      return false;
    }
  }
}
