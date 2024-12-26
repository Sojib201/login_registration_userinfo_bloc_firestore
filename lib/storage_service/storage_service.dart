
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  //static void saveUid(String uid) => _box.write('uid', uid);

  static String? getUid() => _box.read('uid');

  static void saveUserInfo(Map<String, dynamic> userInfo) =>
      _box.write('userInfo', userInfo);

  static Map<String, dynamic>? getUserInfo() => _box.read('userInfo');

  static void clearStorage() => _box.erase();
}
