

import '../../utils/constants.dart';
import 'rest_response.dart';

class NoInternetException implements Exception {
  String cause;

  NoInternetException({this.cause = "No internet connection."});
}

class SomethingWentWrong implements Exception {
  String cause;

  SomethingWentWrong({this.cause = Constants.somthingWentWrong});
}

class JwtExpired implements Exception {
  String jwt;

  JwtExpired({this.jwt = Constants.jwtExpired});
}

class FailureResponse implements Exception {
  RestResponse response;

  FailureResponse({required this.response});
}
