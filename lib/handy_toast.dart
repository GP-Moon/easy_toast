library handy_toast;

import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';

/**
 * Created by GP
 * 2020/12/01.
 */

/// Toast.
class Toast {
  /// Toast a short time.
  static const int SHORT = 1;

  /// Toast a long time.
  static const int LONG = 2;

  /// Toast a message to screen.
  static void toast(
    dynamic message, {
    int duration = Toast.SHORT,
    EdgeInsets padding = const EdgeInsets.only(
      top: 2.0,
      bottom: 2.0,
      left: 5.0,
      right: 5.0,
    ),
    ToastStyle style = const ToastStyle(),
    Gravity gravity = Gravity.bottom,
  }) {
    assert(_supportedMessage(message), 'message type ${message.runtimeType} not supported!!');
    assert(duration != null, 'duration should not be null!!');
    assert(padding != null, 'padding should not be null!!');
    assert(style != null, 'style should not be null!!');
    assert(gravity != null, 'gravity should not be null!!');
    OverlayEntry entry = OverlayEntry(builder: (context) {
      _ToastWidget widget = _ToastWidget(message, padding, style, gravity);
      return widget;
    });
    ContextHolder.currentOverlay.insert(entry);
    Future.delayed(Duration(seconds: duration)).then((value) {
      entry.remove();
    });
  }

  static bool _supportedMessage(dynamic message) {
    return message is String || message is Widget;
  }
}

/// Toast style.
class ToastStyle {
  /// Toast background color.
  final Color color;

  /// Toast background corner radius.
  final double radius;

  /// Toast background border.
  final Border border;

  /// Toast text style.
  final TextStyle style;

  const ToastStyle({
    this.color = Colors.black54,
    this.radius = 10.0,
    this.border,
    this.style = const TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
  })  : assert(color != null),
        assert(radius != null),
        assert(style != null);
}

/// Toast gravity.
enum Gravity {
  /// Toast at top of the screen.
  top,

  /// Toast at center of the screen.
  center,

  /// Toast at bottom of the screen.
  bottom,
}

/// String extension function for toast.
extension ToastableString on String {
  void toast({
    int duration = 1,
    EdgeInsets padding = const EdgeInsets.only(
      top: 2.0,
      bottom: 2.0,
      left: 5.0,
      right: 5.0,
    ),
    ToastStyle style = const ToastStyle(),
    Gravity gravity = Gravity.bottom,
  }) {
    if (this == null) return;
    Toast.toast(
      this,
      duration: duration,
      padding: padding,
      style: style,
      gravity: gravity,
    );
  }
}

/// Widget extension function for toast.
extension ToastableWidget on Widget {
  void toast({
    int duration = 1,
    EdgeInsets padding = const EdgeInsets.only(
      top: 2.0,
      bottom: 2.0,
      left: 5.0,
      right: 5.0,
    ),
    ToastStyle style = const ToastStyle(),
    Gravity gravity = Gravity.bottom,
  }) {
    if (this == null) return;
    Toast.toast(
      this,
      duration: duration,
      padding: padding,
      style: style,
      gravity: gravity,
    );
  }
}

/// Toast widget.
class _ToastWidget extends StatelessWidget {
  _ToastWidget(
    this._message,
    this._padding,
    this._style,
    this._gravity,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      alignment: gravity,
      child: Container(
        padding: _padding,
        decoration: BoxDecoration(
          color: _style.color,
          border: _style.border,
          borderRadius: BorderRadius.circular(_style.radius),
        ),
        child: message,
      ),
    );
  }

  dynamic get message {
    if (this._message is Widget) return this._message;
    String _message = this._message.runtimeType == String ? this._message : '???';
    return Text(
      _message,
      softWrap: true,
      style: _style.style,
    );
  }

  Alignment get gravity {
    switch (_gravity) {
      case Gravity.top:
        return Alignment.topCenter;
      case Gravity.center:
        return Alignment.center;
      case Gravity.bottom:
      default:
        return Alignment.bottomCenter;
    }
  }

  final dynamic _message;
  final EdgeInsets _padding;
  final ToastStyle _style;
  final Gravity _gravity;
}
