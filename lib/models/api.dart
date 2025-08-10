import 'dart:convert';
import 'package:http/http.dart' as http;

class StepsApi{
  static const String baseUrl = "https://api.paypointapp.africa/api";

  /// STEP ONE API CALL
  Future<Map<String, dynamic>> registerStepOne({
    required String lastName,
    required String firstName,
    required String phoneNumber,
    required String email,
  }) async {
    final url = Uri.parse("$baseUrl/auth/register/step-one");

    var request = http.MultipartRequest("POST", url);
    request.fields['last_name'] = lastName;
    request.fields['first_name'] = firstName;
    request.fields['phone_number'] = phoneNumber;
    request.fields['email'] = email;

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(responseBody);
    }else if(response.statusCode == 400){
      return jsonDecode(responseBody);
    } else {
      throw Exception("Step One Failed: ${response.statusCode} → $responseBody");
    }
  }

  /// STEP TWO API CALL
  Future<Map<String, dynamic>> registerStepTwo({
    required String username,
    required String password,
    required String confirmPassword,
    required String referral,
    required String accessToken
  }) async {
    final url = Uri.parse("$baseUrl/auth/register/profile_level_1");

    var request = http.MultipartRequest("POST", url);

    // Add your headers here
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Accept": "application/json",
       "Authorization": "Bearer $accessToken"
    });

    request.fields['username'] = username;
    request.fields['password'] = password;
    request.fields['password_confirmation'] = confirmPassword;
    request.fields['referral'] = referral;

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return jsonDecode(responseBody);
    } else if (response.statusCode == 400) {
      return jsonDecode(responseBody);
    } else {
      throw Exception("Step Two Failed: ${response.statusCode} → $responseBody");
    }
  }

}