# Handy toast for flutter [![Pub version](https://img.shields.io/pub/v/handy_toast.svg)](https://pub.dev/packages/handy_toast)

A toast for flutter and easy to use!
Depends on [context_holder](https://github.com/GP-Moon/context_holder)

### 1. Add dependency

```dart
dependencies:
  handy_toast: ^0.0.3
```

### 2. Init context holder.

Import context holder.

```dart
import 'package:context_holder/context_holder.dart';
```

Set your root app's navigatorKey with ContextHolder.key

For MaterialApp
```dart
void main() {
  runApp(
    MaterialApp(
      /// must set the navigatorKey!!!!!!
      navigatorKey: ContextHolder.key,
      home: Scaffold(),
    ),
  );
}
```

For CupertinoApp
```dart
void main() {
  runApp(
    CupertinoApp(
      /// must set the navigatorKey!!!!!!
      navigatorKey: ContextHolder.key,
      home: Scaffold(),
    ),
  );
}
```

### 3. Import easy toast

```dart
import 'package:handy_toast/handy_toast.dart';
```

### 4. Use easy toast

```dart
'handy toast'.toast();
```

### 4. Other option

Change default style.

```dart
/// change toast background color to green with opacity.
Toast.defaultStyle = ToastStyle(
  color: Colors.green.withOpacity(0.8),
);
```