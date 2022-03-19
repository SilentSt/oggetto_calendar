import 'package:http/http.dart' as http;
import 'package:oggetto_calendar/data/storage/tempStorage/temp_data.dart';
import 'package:oggetto_calendar/ui/constants/app_strings.dart';

class API {
  //roles
  Map<String, String> baseHeaders = {
    'Accept': 'Application/json',
    'Authorization': 'Bearer ${TempData.token}'
  };

  Future<http.Response> getRole() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/roles'),
        headers: baseHeaders);
  }

  Future<http.Response> postRole() async {
    return http.post(Uri.parse(AppStrings.apiUri + '/roles'),
        headers: baseHeaders);
  }

  Future<http.Response> getRoleWithId(int roleId) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/roles/$roleId'),
        headers: baseHeaders);
  }

//roles

//security

  Map<String, String> loginHeaders = {
    'Accept': 'Application/json',
    'Content-Type': 'application/x-www-urlencoded'
  };

  Future<http.Response> login(String loginInfo) async {
    return http.post(Uri.parse(AppStrings.apiUri + '/login'),
        headers: loginHeaders, body: loginInfo);
  }

  Future<http.Response> me() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/me'), headers: baseHeaders);
  }

//security

//Users

  Future<http.Response> getUsers() async {
    return http.get(Uri.parse(AppStrings.apiUri + '/users'),
        headers: baseHeaders);
  }

  Future<http.Response> createUser(String regInfo) async {
    return http.post(Uri.parse(AppStrings.apiUri + '/users'),
        headers: baseHeaders, body: regInfo);
  }

  Future<http.Response> getUser(int id) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/users/$id'),
        headers: baseHeaders);
  }

  Map<String, String> patchHeaders = {
    'Accept': 'Application/json',
    'Authorization': 'Bearer ${TempData.token}',
    'Content-Type': 'Application/json'
  };

  Future<http.Response> patchUser(String patchData, int id) async {
    return http.patch(Uri.parse(AppStrings.apiUri + '/users/$id'),
        headers: patchHeaders, body: patchData);
  }

//Users

//Telegram
  //Future<http.Response> createBotLink()
//Telegram

//Events

  Future<http.Response> getDatedEvents(
      DateTime dateFrom, DateTime dateTo) async {
    return http.get(
        Uri.parse(
            AppStrings.apiUri + '/events?date_from=$dateFrom&date_to=$dateTo'),
        headers: baseHeaders);
  }

  Future<http.Response> postEvents(String data) async {
    return http.post(Uri.parse(AppStrings.apiUri + '/events'),
        headers: patchHeaders, body: data);
  }

  Future<http.Response> getEventWithId(int id) async {
    return http.get(Uri.parse(AppStrings.apiUri + '/events/$id'),
        headers: baseHeaders);
  }

  Future<http.Response> patchEvent(int id, String patchedData) async {
    return http.patch(Uri.parse(AppStrings.apiUri + '/events/$id'),
        headers: patchHeaders, body: patchedData);
  }

//Events
}
