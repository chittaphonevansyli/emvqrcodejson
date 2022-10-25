Map<String, dynamic>? readEmvQrCodeToJson(String qrCode, {List<String>? containObjectId}) {
  if (!qrCode.startsWith("00")) return null;

  String nextItemQrCode = qrCode;
  Map<String, dynamic> qrCodeJson = {};
  containObjectId ??= [];

  try {
    for (int indexItemQrCode = 0; indexItemQrCode < 20; indexItemQrCode++) {
      if (nextItemQrCode == "") break;

      String objectId = nextItemQrCode.substring(0, 2);
      String objectLength = nextItemQrCode.substring(2, 4);
      String objectData = nextItemQrCode.substring(4, int.parse(objectLength) + 4);

      String joinAllObject = objectId + objectLength + objectData;
      int joinAllObjectLength = joinAllObject.length;
      nextItemQrCode = nextItemQrCode.substring(joinAllObjectLength);

      qrCodeJson = {...qrCodeJson, objectId: objectData};

      if (containObjectId.isNotEmpty && containObjectId.contains(objectId)) {
        String subNextItemQrCode = objectData;
        Map<String, dynamic> subQrCodeJson = {};

        for (int indexSubItemQrCode = 0; indexSubItemQrCode < 10; indexSubItemQrCode++) {
          if (subNextItemQrCode == "") break;

          String subObjectId = subNextItemQrCode.substring(0, 2);
          String subObjectLength = subNextItemQrCode.substring(2, 4);
          String subObjectData = subNextItemQrCode.substring(4, int.parse(subObjectLength) + 4);

          subQrCodeJson = {...subQrCodeJson, subObjectId: subObjectData};

          String subJoinAllObject = subObjectId + subObjectLength + subObjectData;
          int subJoinAllObjectLength = subJoinAllObject.length;
          subNextItemQrCode = subNextItemQrCode.substring(subJoinAllObjectLength);
        }

        qrCodeJson = {...qrCodeJson, objectId: subQrCodeJson};
      }
    }
  } catch (e) {
    return null;
  }

  return qrCodeJson;
}
