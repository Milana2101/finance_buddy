import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final localStorage = AppLocalStorage.instance;

class AppLocalStorage {
  static final AppLocalStorage instance = AppLocalStorage._private();

  late final Box _box;

  static const String _boxName = 'localStorage';

  AppLocalStorage._private();

  Future<void> init() async {
    final initPath = await getApplicationSupportDirectory();
    Hive.init(initPath.path);
    _box = await Hive.openBox(_boxName);
  }

  Future<void> write(dynamic key, dynamic value) async {
    await _box.put(_getKey(key), value);
  }

  dynamic read<T>(dynamic key) {
    return _box.get(_getKey(key)) as T;
  }

  Future<void> delete(dynamic key) async {
    await _box.delete(_getKey(key));
  }

  bool contains(dynamic key) {
    return _box.containsKey(_getKey(key));
  }

  Future<void> clear() async {
    await _box.clear();
  }

  dynamic _getKey(dynamic key) {
    if (key is int) {
      return key;
    }
    return key.toString();
  }
}
