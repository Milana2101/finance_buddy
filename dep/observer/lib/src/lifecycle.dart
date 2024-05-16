import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin LifecycleMixin {
  bool _initialized = false;
  bool _isClosed = false;

  /// Checks whether the controller has already been initialized.
  bool get initialized => _initialized;

  /// Checks whether the controller has already been closed.
  bool get isClosed => _isClosed;

  WidgetsBinding get widgetsBinding {
    return WidgetsFlutterBinding.ensureInitialized();
  }

  /// Called immediately after the widget is allocated in memory.
  /// You might use this to initialize something for the controller.
  @protected
  @mustCallSuper
  void onInit() {
    widgetsBinding.addPostFrameCallback((_) => onReady());
  }

  /// Called at the exact moment the widget is allocated in memory.
  /// It uses an internal "callable" type, to avoid any @overrides in subclases.
  /// This method should be internal and is required to define the
  /// lifetime cycle of the subclass.
  // @protected
  @mustCallSuper
  @nonVirtual
  void onStart() {
    if (_initialized) return;
    onInit();
    _initialized = true;
  }

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  void onReady() {}

  /// Called before [onDelete] method. [onClose] might be used to
  /// dispose resources used by the controller. Like closing events,
  /// or streams before the controller is destroyed.
  /// Or dispose objects that can potentially create some memory leaks,
  /// like TextEditingControllers, AnimationControllers.
  /// Might be useful as well to persist some data on disk.
  void onClose() {}

  // Called when the controller is removed from memory.
  @mustCallSuper
  @nonVirtual
  void onDelete() {
    if (_isClosed) return;
    _isClosed = true;
    onClose();
  }
}
