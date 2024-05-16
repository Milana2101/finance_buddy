import 'dart:async';
import 'package:flutter/material.dart';
import '../notifier.dart';
import 'observable_interface.dart';

abstract class ObservableListenable<T> extends ListNotifier
    implements ObservableInterface<T> {
  T _value;
  StreamController<T>? _controller;

  ObservableListenable(this._value);

  StreamController<T> get subject {
    return _controller ??= StreamController<T>.broadcast(
      onCancel: addListener(_streamListener),
    )..add(_value);
  }

  void _streamListener() => subject.add(_value);

  @override
  @mustCallSuper
  void close() {
    removeListener(_streamListener);
    _controller?.close();
    dispose();
  }

  Stream<T> get stream => subject.stream;

  @override
  T get value {
    reportRead();
    return _value;
  }

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  T? call([T? v]) {
    if (v != null) value = v;
    return value;
  }

  @override
  StreamSubscription<T> listen(
    void Function(T)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError ?? false,
    );
  }

  @override
  String toString() => value.toString();
}
