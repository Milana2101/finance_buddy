import 'package:get_it/get_it.dart';

import '../observer.dart';

typedef InstanceBuilderCallback<S> = S Function();
typedef AsyncInstanceBuilderCallback<S> = Future<S> Function();

DependencyManager get locator => DependencyManager.instance;

class DependencyManager {
  DependencyManager._();

  final _logger = Logger();

  static final DependencyManager instance = DependencyManager._();
  final GetIt _getIt = GetIt.instance;
  final Map<String, bool> _initStateMap = {};

  S registerSingleton<S extends LifecycleMixin>(S instance, {String? tag}) {
    final key = _getKey(S, tag);
    if (isRegistered<S>(tag: tag)) {
      return get<S>(tag: tag);
    }
    _getIt.registerSingleton<S>(instance, instanceName: key);
    _log('Registered dependency: $S', tag);
    return get<S>(tag: tag);
  }

  void registerLazySingleton<S extends LifecycleMixin>(
      InstanceBuilderCallback<S> builder,
      {String? tag}) {
    final key = _getKey(S, tag);
    _getIt.registerLazySingleton<S>(builder, instanceName: key);
    _log('Registered lazy dependency: $S', tag);
  }

  // Register an async singleton
  void registerSingletonAsync<S extends LifecycleMixin>(
      AsyncInstanceBuilderCallback<S> builder,
      {String? tag}) {
    final key = _getKey(S, tag);
    _getIt.registerSingletonAsync<S>(builder, instanceName: key);
    _log('Registered async singleton: $S', tag);
  }

  // Register an async lazy singleton
  void registerAsyncLazySingleton<S extends LifecycleMixin>(
      AsyncInstanceBuilderCallback<S> builder,
      {String? tag}) {
    final key = _getKey(S, tag);
    _getIt.registerLazySingletonAsync<S>(builder, instanceName: key);
    _log('Registered async lazy singleton: $S', tag);
  }

  S get<S extends LifecycleMixin>({String? tag}) {
    final key = _getKey(S, tag);
    _log('Created dependency: $S', tag);
    _initLifecycle<S>(tag: tag);
    _initStateMap[key] = true;
    return _getIt.get<S>(instanceName: key);
  }

  // Retrieve an instance asynchronously
  Future<S> getAsync<S extends LifecycleMixin>({String? tag}) async {
    final key = _getKey(S, tag);
    if (_initStateMap.containsKey(key)) {
      _logger.info("Retrieved from memory: $S", tag);
    } else {
      _logger.info("Created $S", tag);
      _initStateMap[key] = true;
      _initLifecycle<S>(tag: tag);
    }
    return await _getIt.getAsync<S>(instanceName: key);
  }

  void delete<S extends LifecycleMixin>({S? instance, String? tag}) {
    final key = _getKey(S, tag);
    if (isRegistered<S>(tag: tag)) {
      final i = instance ?? get<S>(tag: tag);
      i.onDelete();
      _getIt.unregister(instance: instance);
      _initStateMap.remove(key);
      _log('Deleted dependency: $S', tag);
    } else {
      _log('Attempted to delete unregistered dependency: $S', tag);
    }
  }

  bool isRegistered<S extends LifecycleMixin>({String? tag}) {
    return _getIt.isRegistered<S>(instanceName: _getKey(S, tag));
  }

  void _initLifecycle<S extends LifecycleMixin>({String? tag}) {
    final key = _getKey(S, tag);
    if (_initStateMap[key] != true) {
      final instance = _getIt.get<S>(instanceName: key);
      instance.onStart();
      _initStateMap[key] = true;
    }
  }

  String _getKey(Type type, String? tag) {
    return tag == null ? type.toString() : '${type.toString()}$tag';
  }

  void _log(String message, String? tag) {
    final tagMessage = tag != null ? ' with tag: $tag' : '';
    _logger.info('$message$tagMessage', this);
  }
}
