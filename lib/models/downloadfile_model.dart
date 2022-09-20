class DownloadFile {
  DownloadFile({
    this.downStatus = false,
    this.haveerror = false,
    this.filePath = '',
    this.unit8Data,
  });

  bool downStatus;
  bool haveerror;
  String filePath;
  dynamic unit8Data;
}
