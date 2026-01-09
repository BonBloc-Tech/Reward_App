import 'package:get/get.dart';
import 'package:sm_reward_app/services/scripts/netsuite_endpoints.dart';
class EnvironmentServiceController extends GetxService {
  static EnvironmentServiceController get to => Get.find();

  // final RxString _currentEnvironment = 'Production'.obs;
  final RxString _currentEnvironment = 'Sandbox'.obs;
  late Map<String, String> _currentScripts;
  @override
  void onInit() {
    super.onInit();
    _updateScripts();
  }

  void setEnvironment(String env) {
    _currentEnvironment.value = env;
    _updateScripts();
  }

  void _updateScripts() {
    _currentScripts =
        // _currentEnvironment.value == 'Production'
        //     ? ProductionCustomerPortalEndpoints.scripts
        //     : SandboxCustomerPortalEndpoints.scripts;
        _currentEnvironment.value == 'Sandbox'
        ? NetSuiteScripts.scripts
        : ProductionNetSuiteScripts.scripts;
  }

  final Map<String, Map<String, String>> _oauthCredentials = {
    'Sandbox': {
      'apiUrl':
          'https://9841153-sb1.restlets.api.netsuite.com/app/site/hosting/restlet.nl?script=&deploy=1',

      'consumer_key':
          'a543cfbc65d14c15c20e11dfe8a33ce86157265e799db3b8c6a48f15da2126fa',

      'consumer_secret':
          '79c4098dede54964967a1c6efe304471780243421bf24fd51e8861cedecab5a7',

      'token':
          '9fcedf0ac247da884f86ae6e45a233981470a26a46e6eed7cc8d7313510470b0',

      'token_secret':
          'fe041586d199a0ac6d649a2b7e7c3cac8be88e2049ec1fb0511112c2afab71b7',
    },

    'Production': {
      // 'apiUrl':
      //     'https://8154332.restlets.api.netsuite.com/app/site/hosting/restlet.nl?script=&deploy=1',
      // 'consumer_key':
      //     '7ef4d0d5e3c052638851d585aee176a38560a19bd0fc97a5215d3db54293ee45',
      // 'consumer_secret':
      //     '717bf316c3f1c55813501d94fb00190301b69fa679ee22a60102fbe3878ccd65',
      // 'token':
      //     'f88aa1b126129aa9782ff7dc6685f44bd49a8334d757e7394a307f68bbf9e270',
      // 'token_secret':
      //     '2ae790bebdfd991362c6f3e7fe2e2147e29049588c93c9a0c0eab6f32e3e844e',
    },
  };
  String get apiUrl => _oauthCredentials[currentEnvironment]?['apiUrl'] ?? '';
  String get currentEnvironment => _currentEnvironment.value;
  String get consumerKey =>
      _oauthCredentials[currentEnvironment]?['consumer_key'] ?? '';
  String get consumerSecret =>
      _oauthCredentials[currentEnvironment]?['consumer_secret'] ?? '';
  String get token => _oauthCredentials[currentEnvironment]?['token'] ?? '';
  String get tokenSecret =>
      _oauthCredentials[currentEnvironment]?['token_secret'] ?? '';

  String getScriptId(String scriptName) {
    return _currentScripts[scriptName] ?? '';
  }

 

  String get getEmailScript => _currentScripts['getEmail'] ?? '';
  String get verifyOtpScript => _currentScripts['verifyOtp'] ?? '';
}

class ProductionNetSuiteScripts {
 static const Map<String, String> scripts = {
    'login': '3375',
    'logout': '3376',
  };
}


