class HeaderContentType {
  static String baseMimeType = 'application/octet-stream';
  static String json = 'application/json';
  static String pdf = 'application/pdf';
  static String text = 'text/plain';
  static String multipart = 'multipart/form-data';
}

class HeadersRawData {
  String? contentType = HeaderContentType.json;
  String? authorization = "";

  HeadersRawData({
    this.contentType,
    this.authorization,
  });

  factory HeadersRawData.fromJson(Map<String, String> json) {
    return HeadersRawData(
      contentType: json['content-type']!,
      //contentDispositionType: json['content-disposition']!,
      authorization: json['Authorization']!,
    );
  }

  Map<String, String> toJson() {
    final Map<String, String> data = Map<String, String>();
    data['content-type'] = this.contentType ?? HeaderContentType.json;
    //data['content-disposition'] = this.contentDispositionType ?? HeaderContentDispositionType.unknown;
    data['Authorization'] = this.authorization ?? "";
    return data;
  }
}
