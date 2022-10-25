String? writeJsonToEmvQrCode(Map<String, dynamic>? qrCodeJson) {
  if (qrCodeJson == null) return null;

  String genJsonToString = "";
  qrCodeJson.forEach((objectId, objectData) {
    String lengthObjectData = (objectData.toString().length).toString().padLeft(2, "0");

    if (objectData.runtimeType != String) {
      String subGenJsonToString = "";

      final subData = objectData as Map<String, dynamic>;
      subData.forEach((subObjectId, subObjectData) {
        String subLengthObjectData = (subObjectData.toString().length).toString().padLeft(2, "0");
        subGenJsonToString += "$subObjectId$subLengthObjectData$subObjectData";
      });

      genJsonToString += "$objectId${subGenJsonToString.length}$subGenJsonToString";
    } else {
      genJsonToString += "$objectId$lengthObjectData$objectData";
    }
  });

  return genJsonToString;
}
