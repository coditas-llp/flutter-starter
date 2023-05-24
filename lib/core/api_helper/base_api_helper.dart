import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scaffold/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../injection_container.dart';
import '../utility/utils.dart';
import 'api_utils.dart';

class BaseApiHelper {
  Future<dynamic> get(String url,
      {String query = "",
      Map<String, String>? headers,
      Encoding? encoding}) async {
    try {
      debugPrint('Api Get, url ${APIUtils.apiEndPoint}$url/$query ');
      var token = getIt<SharedPreferences>().getString("token");

      headers ??= <String, String>{};
      headers['Content-Type'] = 'application/json';
      headers['Accept'] = 'application/json';
      headers['Authorization'] = 'Bearer $token';
      headers['HeaderData'] = '$token';

      final response = await http.get(
          Uri.parse(APIUtils.apiEndPoint +
              url +
              (Utils.isNotNull(query) ? "/$query" : "")),
          headers: headers);
      debugPrint("response ${response.body.toString()}");
      return _response(response);
    } on SocketException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> post(String url,
      {Map<String, String>? headers,
      required Object body,
      Encoding? encoding}) async {
    debugPrint('Api POST, url ${APIUtils.apiEndPoint}$url \ndata $body ');
    var token = getIt<SharedPreferences>().getString("token");

    headers ??= <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    headers['Authorization'] = 'Bearer $token';
    headers['HeaderData'] = '$token';

    try {
      final response = await http.post(Uri.parse(APIUtils.apiEndPoint + url),
          headers: headers, body: body, encoding: encoding);
      debugPrint(
          "$url response ${response.body}\nstatusCode ${response.statusCode}");
      return _response(response);
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> postMultipart(
      String url, List<http.MultipartFile> files, Map<String, String> fields,
      {Map<String, String>? headers, Encoding? encoding}) async {
    debugPrint('Api Post, url $url \nfields ${fields.toString()}');
    var token = getIt<SharedPreferences>().getString("token");

    headers ??= <String, String>{};

    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    headers['Authorization'] = 'Bearer $token';
    headers['HeaderData'] = '$token';

    try {
      var uri = Uri.parse(APIUtils.apiEndPoint + url);
      debugPrint(APIUtils.apiEndPoint + url);
      var request = http.MultipartRequest("POST", uri);
      request.fields.addAll(fields);
      request.files.addAll(files);
      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _response(response);
    } on SocketException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200: //success
        return response.body;
      case 400: //bad req
        throw ServerException("Bad request");
      case 401: //unauthorized
        throw ServerException("Unauthorized");
      case 403:
      case 404: //Unauthenticated
        throw ServerException("Unauthenticated");
      case 429: //too many req
        throw ServerException("Too many req");
      case 300:
        throw ServerException("No data found");
      case 500: //something went wrong at server side
      default:
        throw ServerException("Something went wrong");
    }
  }
}
