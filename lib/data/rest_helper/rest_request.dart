// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import '../api_helper.dart';
import 'rest_const.dart';
import 'rest_exceptions.dart';
import 'rest_response.dart';

class RestRequest {
//  static final String DEFAULT_BASE_URL=ApiHelper.BASE_URL;
  RequestMethod reqMethod;

  ContentType contentType;
  String baseUrl;
  String reqUrl;
  String? msg;
  Map<String, String>? header;
  Map<String, dynamic>? queryParams;
  FormData? formdata;
  Map<String, String>? params;
  Map<String, List<String>>? attachments;
  dynamic reqParamJson;
  var _log = FimberLog("RestRequest");
  RestRequest({
    this.reqMethod = RequestMethod.METHOD_POST,
    this.contentType = ContentType.CONTENT_FORMDATA,
    this.baseUrl = ApiHelper.BASE_URL,
    required this.reqUrl,
    this.header,
    this.params,
    this.attachments,
    this.reqParamJson,
  });

  Future<Response> dioSend() async {
    _log.d("Sending Request : $this");
    var dio = Dio();
    dio.options.baseUrl = reqUrl == ApiHelper.API_LOGIN ? ApiHelper.BASE_LOGIN_URL : baseUrl;
    debugPrint("Base url : ${dio.options.baseUrl}");
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      try {
        Response res;
        switch (reqMethod) {
          case RequestMethod.METHOD_GET:
            {
              dio.options.headers = header;
              if (queryParams != null) {
                res = await dio.get(getUriForGetReq().toString());
              } else {
                res = await dio.get(getUri().toString());
                // res = await dio.get(queryParams == null
                //     ? getUriForGetReq().toString()
                //     : getUri().toString());
              }
            }
            _log.d("Response for : $reqUrl => $res");
            break;
          case RequestMethod.METHOD_POST:
            {
              switch (contentType) {
                case ContentType.CONTENT_JSON:
                  dio.options.headers = header;
                  res = await dio.post(
                    reqUrl,
                    options: Options(contentType: Headers.jsonContentType),
                    data: reqParamJson == null ? jsonEncode(params) : jsonEncode(reqParamJson),
                  );

                  _log.d("Response for : $reqUrl => $res");
                  break;

                case ContentType.CONTENT_FORMDATA:
                  dio.options.headers = header;
                  // dio.options.headers["Accept"] = "application/json";
                  dio.options.headers["Content-Type"] = "multipart/form-data";

                  res = await dio.post(reqUrl,
                      // options: Options(
                      //     headers: header,
                      //     contentType: Headers.formUrlEncodedContentType),
                      // data: reqParamJson == null
                      //     ? jsonEncode(params)
                      //     :
                      // queryParameters: queryParams,
                      data: formdata);
                  _log.d("Response for : $reqUrl => $res");
                  break;
                case ContentType.CONTENT_MULTIPART:
                  dio.options.headers["Content-Type"] = "multipart/form-data";
                  dio.options.headers = header;
                  res = await dio.post(reqUrl, data: jsonEncode(params));
                  _log.d("Response for : $reqUrl => $res");
                  break;
              }
            }
            break;

          case RequestMethod.METHOD_PUT:
            {
              switch (contentType) {
                case ContentType.CONTENT_JSON:
                  dio.options.headers = header;
                  res = await dio.put(reqUrl,
                      options: Options(contentType: Headers.jsonContentType),
                      data: queryParams != null ? jsonEncode(queryParams) : jsonEncode(params));
                  _log.d("Response for : $reqUrl => $res");
                  debugPrint(res.toString());
                  break;

                case ContentType.CONTENT_FORMDATA:
                  dio.options.headers["content-type"] = "multipart/form-data";
                  dio.options.headers = header;

                  res = await dio.put(reqUrl,
                      // options: Options(
                      //     headers: header,
                      //     contentType: Headers.formUrlEncodedContentType),
                      // data: reqParamJson == null
                      //     ? jsonEncode(params)
                      //     :
                      // queryParameters: queryParams,
                      data: formdata);
                  _log.d("Response for : $reqUrl => $res");
                  break;
                case ContentType.CONTENT_MULTIPART:
                  dio.options.headers["Content-Type"] = "multipart/form-data";
                  dio.options.headers = header;
                  res = await dio.put(reqUrl, data: jsonEncode(params));
                  _log.d("Response for : $reqUrl => $res");
                  break;
              }
            }
            break;
        }
        log("${dio.options.baseUrl} $reqUrl ==> ${res.statusCode}");
        return res;
      } on DioError catch (e) {
        Map<String, dynamic> resJson;
        var isSuccess = true;
        String message = "";
        String jwtMessage = "";
        int status = 1;
        int responseCode = 1;
        var res;
        if (e.response != null) {
          log("${dio.options.baseUrl}$reqUrl ==> ${e.response.toString()} $e");
          // log("${e.response!.data}");
          debugPrint(e.response.toString());
          debugPrint(jsonDecode(e.response!.data));
          resJson = jsonDecode(e.response!.data);

          if (resJson.containsKey("status")) {
            status = resJson["status"];
            if (status != 200) {
              isSuccess = false;
              if (status == 401) {
                if (resJson.containsKey("message")) {
                  jwtMessage = resJson["message"];
                  if (jwtMessage == "JWT Expired") {
                    message = "Your Session has been Expired Please Login Again.";
                  } else if (resJson.containsKey("message")) {
                    message = resJson["message"];
                  }
                }
              } else if (resJson.containsKey("message")) {
                message = resJson["message"];
              } else if (resJson.containsKey("ERROR")) {
                message = resJson["ERROR"];
              }
            }
          }
          if (resJson.containsKey("responseCode")) {
            responseCode = resJson["responseCode"];
            if (responseCode != 200) {
              isSuccess = false;
              if (resJson.containsKey("responseMessage")) {
                message = resJson["responseMessage"];
              }
            }
          }
          if (resJson.containsKey("status")) {
            status = resJson["status"];
            if (status != 200) {
              isSuccess = false;
              if (resJson.containsKey("ERROR")) {
                message = resJson["ERROR"];
              }
            }
          }
          res = RestResponse(this,
              // streamedResponse: ,
              strResponse: e.response!.data,
              isSuccess: isSuccess,
              message: message,
              status: status);
        }
        _log.d("Response is ${res.toString()}");
        throw FailureResponse(response: res);
      } on FailureResponse {
        rethrow;
      } catch (e, stacktrace) {
        debugPrint(e.toString());
        debugPrint(stacktrace.toString());
        _log.e("Something Went Wrong", ex: e, stacktrace: stacktrace);
        throw SomethingWentWrong();
      }
    } else {
      _log.e(
        "No internet error",
      );
      throw NoInternetException();
    }
  }

  @override
  String toString() {
    StringBuffer stringBuilder = StringBuffer("RestRequest");
    stringBuilder.write("\n reqMethod=");
    if (reqMethod == RequestMethod.METHOD_GET) {
      stringBuilder.write("get");
    } else {
      stringBuilder.write("post");
      stringBuilder.write("\n content type=");

      switch (contentType) {
        case ContentType.CONTENT_JSON:
          {
            stringBuilder.write("json");
            if (reqParamJson != null) {
              stringBuilder.write("\n JSONObject=");
              stringBuilder.write(reqParamJson.toString());
            }
          }
          break;
        case ContentType.CONTENT_FORMDATA:
          stringBuilder.write("formdata");
          break;
        case ContentType.CONTENT_MULTIPART:
          stringBuilder.write("multipart");
          break;
      }
    }
    stringBuilder.write("\nbaseurl=");
    stringBuilder.write(baseUrl);
    stringBuilder.write("\n url");
    stringBuilder.write(reqUrl);
    if (header != null) {
      stringBuilder.write("\n headers");
      header?.forEach((key, value) {
        stringBuilder.write("\n");
        stringBuilder.write(key);
        stringBuilder.write(":");
        stringBuilder.write(value);
      });
    }

    if (params != null) {
      stringBuilder.write("\n params");
      params?.forEach((key, value) {
        stringBuilder.write("\n");
        stringBuilder.write(key);
        stringBuilder.write(":");
        stringBuilder.write(value);
      });
    }
    if (attachments != null) {
      stringBuilder.write("\n attachments");
      attachments?.forEach((key, value) {
        stringBuilder.write("\n");
        stringBuilder.write(key);
        stringBuilder.write(":");
        for (var files in value) {
          stringBuilder.write("\n ");
          stringBuilder.write(files);
        }
      });
    }
    return stringBuilder.toString();
  }

  Uri getUri() {
    var sb = StringBuffer();
    sb.write(baseUrl);
    sb.write(reqUrl);
    if (queryParams != null && queryParams!.isNotEmpty) {
      sb.write("?");
      queryParams?.forEach((key, value) {
        sb.write(key);
        sb.write("=");
        sb.write(value);
        sb.write("&");
      });
      var urlToModify = sb.toString();
      return Uri.parse(urlToModify.substring(0, urlToModify.length - 1));
    } else {
      return Uri.parse(sb.toString());
    }
  }

  Uri getUriForGetReq() {
    var sb = StringBuffer();
    sb.write(baseUrl);
    sb.write(reqUrl);
    if (queryParams != null && queryParams!.isNotEmpty) {
      queryParams?.forEach((key, value) {
        sb.write(value);
      });
      var urlToModify = sb.toString();
      return Uri.parse(urlToModify);
    } else {
      return Uri.parse(sb.toString());
    }
  }
}
