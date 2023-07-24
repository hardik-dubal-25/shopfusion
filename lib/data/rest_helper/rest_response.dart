import 'rest_request.dart';
// import 'package:http/http.dart' as Http;

class RestResponse {
//   String resString = null;
//   String error = null;
  RestRequest request;

//   ResponseType resType;

  // Http.StreamedResponse streamedResponse;

  String? strResponse;
  bool? isSuccess = true;
  int? status = 1;
  String? message;

  RestResponse(this.request,
      {
      // required this.streamedResponse,
      this.strResponse,
      this.isSuccess,
      this.message,
      this.status});

  @override
  String toString() {
    StringBuffer stringBuffer = StringBuffer("RestResponse");
    stringBuffer.write("\n");
    // stringBuffer.write("Status Code:${streamedResponse.statusCode}");
    stringBuffer.write("String Response:$strResponse");
    stringBuffer.write("Message:$message");

    return stringBuffer.toString();
  }
}
