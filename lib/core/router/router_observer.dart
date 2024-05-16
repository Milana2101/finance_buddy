import 'package:finance_buddy/index.dart';

class RouterObserver extends NavigatorObserver {
  final _logger = Logger();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logger.info(
      'Pushed route: ${route.settings.name}, previous route: ${previousRoute?.settings.name}',
      this,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logger.info(
      'Popped route: ${route.settings.name}, previous route: ${previousRoute?.settings.name}',
      this,
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _logger.info(
      'Removed route: ${route.settings.name}, previous route: ${previousRoute?.settings.name}',
      this,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logger.info(
      'Replaced old route: ${oldRoute?.settings.name} with new route: ${newRoute?.settings.name}',
      this,
    );
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    _logger.info(
      'Started user gesture on route: ${route.settings.name}, previous route: ${previousRoute?.settings.name}',
      this,
    );
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    _logger.info(
      'Stopped user gesture.',
      this,
    );
  }
}
