<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

```dart
const qrCode = "000201010212020200385700166234XXXXXXXX96580106623479020300103160302XXXXXXXX02325204000153034185802LA5907default6007default63044827";
final dataEmvQrCodeToJson = readEmvQrCodeToJson(qrCode);
print(dataEmvQrCodeToJson);

final jsonToEmvQrCode = writeJsonToEmvQrCode(dataEmvQrCodeToJson);
print(jsonToEmvQrCode);
```
