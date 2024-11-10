<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# Simple Date Formatter
A very simple package to format `DateTime` objects in simple terms like Today, Next Week Wednesday etc.

## Usage

Import `simple_date_formatter.dart`

```dart
import "package:simple_date_formatter/simple_date_formatter.dart";
```

Use the `fromNow` getter on any  `DateTime` object.
```dart
DateTime someDate = DateTime.now().add(Duration(days: 20));
print(someDate.fromNow); // Next Week Friday.
// This getter formats the date up to six week before and after now, beyond which it will return normal date formatting.
```

## Additional Features
This package also exposes two extra getters and one method. `monthName` getter `weekdayName` getter and `addTime` method.
```dart
DateTime someDate = DateTime.now().add(Duration(days: 20));
print(someDate.monthName); // December
print(someDate.weekdayName): // Friday
someDate.addTime(TimeOfDay(hour: 10: minute: 30)); // adds time to `DateTime` object and returns it.
```


#### Don't forget to leave a like 👍
