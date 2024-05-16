import 'dart:async';

import 'observable_listenable.dart';

class Obs<T> extends _ObsImpl<T> {
  Obs(super.initial);

  @override
  dynamic toJson() => _toJson(value);
}

class ObsNullable<T> extends _ObsImpl<T?> {
  ObsNullable([super.initial]);

  @override
  dynamic toJson() => _toJson(value);
}

abstract class _ObsImpl<T> extends ObservableListenable<T>
    with RxObjectMixin<T> {
  _ObsImpl(super.initial);

  void addError(Object error, [StackTrace? stackTrace]) {
    subject.addError(error, stackTrace);
  }
}

mixin RxObjectMixin<T> on ObservableListenable<T> {
  bool firstRebuild = true;
  bool sentToStream = false;

  String get string => value.toString();

  @override
  String toString() => value.toString();

  dynamic toJson() => value;

  @override
  bool operator ==(Object o) =>
      o is T ? value == o : o is RxObjectMixin<T> && value == o.value;

  @override
  int get hashCode => value.hashCode;

  @override
  set value(T val) {
    if (isDisposed || (value == val && !firstRebuild)) return;
    firstRebuild = false;
    sentToStream = true;
    super.value = val;
  }

  StreamSubscription<T> listenAndPump(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final subscription = listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    subject.add(value);
    return subscription;
  }

  void bindStream(Stream<T> stream) {
    final sub = stream.listen((va) => value = va);
    reportAdd(sub.cancel);
  }

  dynamic _toJson(dynamic val) {
    try {
      return val?.toJson();
    } catch (_) {
      throw '$T has no method [toJson]';
    }
  }
}
