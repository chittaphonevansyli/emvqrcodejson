import 'package:emvqrjson/emvqrjson.dart';

void main() {
  const qrCode = "000201010212020200385700166234XXXXXXXX96580106623479020300103160302XXXXXXXX02325204000153034185802LA5907default6007default63044827";
  final dataEmvQrCodeToJson = readEmvQrCodeToJson(qrCode);
  print(dataEmvQrCodeToJson);

  final jsonToEmvQrCode = writeJsonToEmvQrCode(dataEmvQrCodeToJson);
  print(jsonToEmvQrCode);
}
