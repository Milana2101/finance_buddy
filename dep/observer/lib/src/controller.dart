import '../observer.dart';

abstract class Controller extends ListNotifier with LifecycleMixin {
  void update() => refresh();
}

abstract class Service with LifecycleMixin {}
