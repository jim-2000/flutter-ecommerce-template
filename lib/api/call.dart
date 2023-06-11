import 'dart:developer';
import 'dart:io';

import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:http/http.dart' as http;

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

///-------------------post method ----------------------------------------------------------------
Future<http.Response> reqPostAPIMethod(
  String apiUrl,
  Map<String, String>? apiHeaders,
  Map<String, dynamic>? apiBodyRawData,
) {
  late Future<http.Response> response;
  log(apiBodyRawData.toString());
  try {
    response = http.Client()
        .post(Uri.parse(apiUrl), headers: apiHeaders, body: apiBodyRawData)
        .timeout(const Duration(seconds: 300), onTimeout: () {
      return response;
    });
  } on SocketException catch (_) {
    showSimpleNotification(
      msg: "Network connectivity not found. Try again.",
    );
  }
  return response;
}

/// ---------------- get method ----------------------------------------------------------------

Future<http.Response> reqGetAPIMethod(String apiUrl,
    {Map<String, String>? apiHeaders}) {
  late Future<http.Response> response;
  try {
    //Handle you network call code block in here
    response = http.Client()
        .get(
      Uri.parse(apiUrl),
      headers: apiHeaders,
    )
        .timeout(
      const Duration(seconds: 200),
      onTimeout: () {
        return response;
      },
    );
  } on SocketException catch (_) {
    showSimpleNotification(
      msg: "Network connectivity not found. Try again.",
    );
    //To handle Socket Exception in case network connection is not available during initiating your network call
  }

  return response;
}

//
///-------------------post method ----------------------------------------------------------------
Future<http.Response> reqPostAPIMethodAuthorize(
  String apiUrl,
  apiBodyRawData,
) async {
  late Future<http.Response> response;
  String token = await fetchStringValuesSF("authToken");
  final Map<String, String> headers = {
    "x-api-key": "YOUR_API_KEY",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,PATCH,OPTIONS",
    'Content-Type': 'application/json',
    "Authorization": "Bearer $token",
  };
  try {
    response = http.Client()
        .post(Uri.parse(apiUrl), headers: headers, body: apiBodyRawData)
        .timeout(const Duration(seconds: 300), onTimeout: () {
      return response;
    });
  } on SocketException catch (_) {
    showSimpleNotification(
      msg: "Network connectivity not found. Try again.",
    );
  }
  return response;
}
