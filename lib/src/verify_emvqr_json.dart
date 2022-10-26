import 'dart:convert';
import 'package:crclib/catalog.dart';

bool isEmvQrCode(String qrCode) {
  final emqrForChecksum = qrCode.substring(0, qrCode.length - 4);
  final emqrForCheckEmv = qrCode.substring(qrCode.length - 4, qrCode.length);

  final convertCrc16 = Crc16CcittFalse().convert(utf8.encode(emqrForChecksum)).toBigInt().toInt();
  String checkSumQrCode = convertCrc16.toRadixString(16).padLeft(4, "0").toUpperCase();

  return emqrForCheckEmv == checkSumQrCode;
}
