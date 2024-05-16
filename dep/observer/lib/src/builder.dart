import 'package:flutter/material.dart';

import '../observer.dart';

class ObserverBuilder<T extends Controller> extends StatefulWidget {
  const ObserverBuilder({
    super.key,
    this.controller,
    required this.builder,
    this.persistent = false,
  });

  final T Function(BuildContext context)? controller;
  final Widget Function(T controller) builder;
  final bool persistent;

  @override
  State<ObserverBuilder<T>> createState() => _ObserverBuilderState<T>();
}

class _ObserverBuilderState<T extends Controller>
    extends State<ObserverBuilder<T>> {
  late final T _controller;

  @override
  void initState() {
    super.initState();

    T initialController;

    if (locator.isRegistered<T>()) {
      initialController = locator.get<T>();
    } else {
      initialController = widget.controller!.call(context);
      locator.registerSingleton(initialController);
    }

    _controller = initialController;

    _controller.addListener(_handleChange);
  }

  @override
  void dispose() {
    if (!widget.persistent) {
      locator.delete(instance: _controller);
    }
    super.dispose();
  }

  void _handleChange() {
    setState(() {
      // The listenable's state is our build state, and it changed already.
    });
  }

  @override
  Widget build(BuildContext context) {
    // final controller =
    return widget.builder(_controller);
  }
}
