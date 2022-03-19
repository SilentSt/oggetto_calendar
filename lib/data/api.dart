import 'package:http/http.dart' as http;
import 'package:oggetto_calendar/data/storage/tempStorage/temp_data.dart';
import 'package:oggetto_calendar/ui/constants/app_strings.dart';

class API {
  //roles
  static Map<String, String> baseHeaders = {
    'Accept': 'Application/json',
    'Authorization': 'Bearer ${TempData.token}'
  };

  static Future<http.Response> getRole() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/roles'),
        headers: baseHeaders);
  }

  static Future<http.Response> postRole() async {
    return http.post(Uri.parse(AppStrings.apiUri + '/roles'),
        headers: baseHeaders);
  }

  static Future<http.Response> getRoleWithId(int roleId) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/roles/$roleId'),
        headers: baseHeaders);
  }

//roles

//security

  static Map<String, String> loginHeaders = {
    'Accept': 'Application/json',
    'Content-Type': 'application/x-www-urlencoded'
  };

  static Future<Map<int, String>> login(Map<String, String> loginInfo) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppStrings.apiUri + '/login'))
          ..headers.addAll(loginHeaders)
          ..fields.addAll(loginInfo);
    var resp = (await request.send());
    var ret = <int, String>{};
    ret[resp.statusCode] = await resp.stream.bytesToString();
    return ret;
  }

  static Future<http.Response> me() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/me'), headers: baseHeaders);
  }

//security

//Users

  static Future<http.Response> getUsers() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/users'),
        headers: baseHeaders);
  }

  static Future<http.Response> createUser(String regInfo) async {
    return http.post(Uri.parse(AppStrings.apiUri + '/users'),
        headers: patchHeaders, body: regInfo);
  }

  static Future<http.Response> getUser(int id) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/users/$id'),
        headers: baseHeaders);
  }

  static Map<String, String> patchHeaders = {
    'Accept': 'Application/json',
    'Authorization': 'Bearer ${TempData.token}',
    'Content-Type': 'Application/json'
  };

  static Future<http.Response> patchUser(String patchData, int id) async {
    return http.patch(Uri.parse(AppStrings.apiUri + '/users/$id'),
        headers: patchHeaders, body: patchData);
  }

//Users

//Telegram
  //Future<http.Response> createBotLink()
//Telegram

//Events

  static Future<http.Response> getDatedEvents(
      DateTime dateFrom, DateTime dateTo) async {
    return http.get(
        Uri.parse(
            AppStrings.apiUri + '/events?date_from=$dateFrom&date_to=$dateTo'),
        headers: baseHeaders);
  }

  static Future<http.Response> postEvents(String data) async {
    return http.post(Uri.parse(AppStrings.apiUri + '/events'),
        headers: patchHeaders, body: data);
  }

  static Future<http.Response> getEventWithId(int id) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/events/$id'),
        headers: baseHeaders);
  }

  static Future<http.Response> patchEvent(int id, String patchedData) async {
    return http.patch(Uri.parse(AppStrings.apiUri + '/events/$id'),
        headers: patchHeaders, body: patchedData);
  }

//Events
}
