import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Logger {
  static const _defaultLogName = 'log';

  void _logWithColor(
    String message,
    String color, [
    dynamic name,
  ]) {
    if (kIsWeb) {
      log(message);
      return;
    }
    final n = name == _defaultLogName ? _defaultLogName : '${name.runtimeType}';
    final buildPrefix = '$color[$n]: \x1B[0m';
    final buildMessage = '$color$message\x1B[0m';
    final logMessage = '$buildPrefix$buildMessage';
    stdout.writeln(logMessage);
  }

  void error(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(message.toString(), '\x1B[31m', name); // Red for error
  }

  void warning(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(message.toString(), '\x1B[33m', name); // Yellow for warning
  }

  void info(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(message.toString(), '\x1B[34m', name); // Cyan for info
  }

  void debug(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(message.toString(), '\x1B[35m', name); // Magenta for debug
  }

  void success(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(message.toString(), '\x1B[32m', name); // Green for success
  }

  void critical(dynamic message, [dynamic name = _defaultLogName]) {
    _logWithColor(
        message.toString(), '\x1B[91m', name); // Bright Red for critical
  }
}
