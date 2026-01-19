// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:netbridge/netbridge.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/secure_storage_service.dart';

class RestletApi {
  late NetsuiteClient client;
  late String _baseUrl;
  final EnvironmentServiceController _envService;

  RestletApi({required EnvironmentServiceController envService})
    : _envService = envService {
    final uri = Uri.parse(_envService.apiUrl);
    _baseUrl =
        '${uri.scheme}://${uri.host}${uri.path}?${uri.queryParameters['deploy'] != null ? 'deploy=${uri.queryParameters['deploy']}' : ''}';
    _initClient();
  }
  void _initClient() {
    final oauthCredentials = {
      'consumer_key': _envService.consumerKey,
      'consumer_secret': _envService.consumerSecret,
      'token': _envService.token,
      'token_secret': _envService.tokenSecret,
    };

    print(
      'Initializing client with ${_envService.currentEnvironment} credentials',
    );
    print('URL:${_envService.apiUrl}');
    print('Consumer Key: ${_envService.consumerKey}');
    print('consumer_secret: ${_envService.consumerSecret}');
    print('Token: ${_envService.token}');
    print('token_secret: ${_envService.tokenSecret}');

    Credentials credentials = Credentials(oauthCredentials);
    RequestHandler handler = OAuthHandler(credentials: credentials);
    client = NetsuiteClient(handler: handler);
  }

  void init() async {
    _initClient();
  }

 Future<dynamic> fetchReportData(
  String scriptId,
  Map<String, dynamic> requestBody,
) async {
  try {
    final token = await Get.find<SecureStorageService>().getToken();

    final uri = Uri.parse(
      '$_baseUrl&script=${Uri.encodeComponent(scriptId)}',
    );

    // 🔥 MERGE TOKEN INTO BODY
    final body = {
      ...requestBody,
      if (token != null) "token": token,
    };

    print('Script ID: $scriptId');
    print('Request Body: ${json.encode(body)}');

    final response = await client.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    print('Response Body for script ID: $scriptId');
    print(response.body);

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final data = json.decode(response.body);

      // 🔥 AUTO LOGOUT CHECK
      if (data['status'] == 'SESSION_EXPIRED') {
        await Get.find<SecureStorageService>().logout();
        Get.offAllNamed('/login');
        return null;
      }

      return data;
    }

    return null;
  } catch (e) {
    print('Error fetching Restlet data: $e');
    return null;
  }
}

  Future<dynamic> postRequest(
    String scriptId,
    Map<String, dynamic> requestBody,
  ) async {
    try {
      final encodedScriptId = Uri.encodeComponent(scriptId);
      // final uri = Uri.parse(
      //   'https://8154332-sb1.restlets.api.netsuite.com/app/site/hosting/restlet.nl?script=$encodedScriptId&deploy=1',
      // );
      final uri = Uri.parse('$_baseUrl&script=$encodedScriptId');

      print('Request URL for script ID: $scriptId');
      print(uri.toString());
      print('Request Body: ${json.encode(requestBody)}');

      final response = await client.post(
        uri,
        body: requestBody,
        headers: {'Content-Type': 'application/json'},
      );

      print('Response Body for script ID: $scriptId');
      print(response.body);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          if (response.body.trim().startsWith('{')) {
            return json.decode(response.body);
          } else {
            print('Non-JSON Response: ${response.body}');
            return response.body;
          }
        } else {
          print('API Connection Successful, but Empty response body received');
          return {};
        }
      } else {
        print('Failed to post request: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error posting request: $e');
      return null;
    }
  }

  Future<dynamic> getRequest(
    String scriptId,
    Map<String, dynamic> queryParams,
  ) async {
    try {
      final encodedScriptId = Uri.encodeComponent(scriptId);
      // final uri = Uri.parse(
      //   'https://8154332-sb1.restlets.api.netsuite.com/app/site/hosting/restlet.nl?script=$encodedScriptId&deploy=1',
      // );
      final uri = Uri.parse('$_baseUrl&script=$encodedScriptId');

      print('Request URL for script ID:$scriptId');
      print(uri.toString());

      final response = await client.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      print('Response Body for script ID: $scriptId');
      print(response.body);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          print('API Connection Successful, but Empty response body received');
          return {};
        }
      } else {
        print('Failed to fetch GET request: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error with GET request: $e');
      return null;
    }
  }

  void prettyprint(String str) {
    const JsonEncoder jEncoder = JsonEncoder.withIndent(" ");
    final jsonData = json.decode(str);
    print(jEncoder.convert(jsonData));
  }
}
