import 'package:flutter/material.dart';

// This callback remove the listener on addListener function
typedef Disposer = void Function();

// replacing StateSetter, return if the Widget is mounted for extra validation.
// if it brings overhead the extra call,
typedef StateUpdate = void Function();

abstract class ListNotifier extends Listenable with NotifierImpl {}

mixin NotifierImpl on Listenable {
  final _updaters = <StateUpdate>[];

  @override
  Disposer addListener(StateUpdate listener) {
    // assert(_debugAssertNotDisposed());
    _updaters.add(listener);
    return () => _updaters.remove(listener);
  }

  bool containsListener(StateUpdate listener) {
    return _updaters.contains(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    // assert(_debugAssertNotDisposed());
    _updaters.remove(listener);
  }

  @protected
  void refresh() {
    // assert(_debugAssertNotDisposed());
    _notifyUpdate();
  }

  @protected
  void reportRead() {
    Notifier.instance.read(this);
  }

  @protected
  void reportAdd(VoidCallback disposer) {
    Notifier.instance.add(disposer);
  }

  void _notifyUpdate() {
    final list = _updaters.toList();
    for (var element in list) {
      element();
    }
  }

  bool get isDisposed => _updaters.isEmpty;

//   bool _debugAssertNotDisposed() {
//     assert(() {
//       if (isDisposed) {
//         throw FlutterError('''A $runtimeType was used after being disposed.\n
// 'Once you have called dispose() on a $runtimeType, it can no longer be used.''');
//       }
//       return true;
//     }());
//     return true;
//   }

  int get listenersLength {
    // assert(_debugAssertNotDisposed());
    return _updaters.length;
  }

  @mustCallSuper
  void dispose() {
    // assert(_debugAssertNotDisposed());
    _updaters.clear();
  }
}

class Notifier {
  Notifier._();

  static Notifier? _instance;

  static Notifier get instance => _instance ??= Notifier._();

  NotifyData? _notifyData;

  void add(VoidCallback listener) {
    _notifyData?.disposers.add(listener);
  }

  void read(NotifierImpl updaters) {
    final listener = _notifyData?.updater;
    if (listener != null && !updaters.containsListener(listener)) {
      updaters.addListener(listener);
      add(() => updaters.removeListener(listener));
    }
  }

  T append<T>(NotifyData data, T Function() builder) {
    _notifyData = data;
    final result = builder();
    if (data.disposers.isEmpty && data.throwException) {
      throw const ObservableError();
    }
    _notifyData = null;
    return result;
  }
}

class NotifyData {
  const NotifyData({
    required this.updater,
    required this.disposers,
    this.throwException = true,
  });

  final StateUpdate updater;
  final List<VoidCallback> disposers;
  final bool throwException;
}

class ObservableError {
  const ObservableError();

  @override
  String toString() {
    return """
      [$runtimeType You should pass a Observable variable to widget]
      """;
  }
}
