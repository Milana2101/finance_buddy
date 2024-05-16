import 'package:flutter/material.dart';

import '../notifier.dart';

typedef WidgetCallback = Widget Function();

class Observable extends StatelessWidget {
  final WidgetCallback builder;

  const Observable({super.key, required this.builder});

  @override
  StatelessElement createElement() => _ObxElement(this);

  @override
  Widget build(BuildContext context) {
    return builder();
  }
}

class _ObxElement = StatelessElement with _StatelessObserverComponent;

/// a Component that can track changes in a reactive variable
mixin _StatelessObserverComponent on StatelessElement {
  List<Disposer>? disposers = <Disposer>[];

  @override
  Widget build() {
    return Notifier.instance.append(
      NotifyData(disposers: disposers!, updater: markNeedsBuild),
      super.build,
    );
  }

  @override
  void unmount() {
    super.unmount();
    for (final disposer in disposers!) {
      disposer();
    }
    disposers!.clear();
    disposers = null;
  }
}
