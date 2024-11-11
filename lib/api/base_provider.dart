import 'package:get/get.dart';

import '../shared/utils/app_flavor_helper.dart';
import 'api_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class BaseProvider extends GetConnect {
  AppFlavor flavor;
  String? _httpBaseUrl;

  BaseProvider(this.flavor) {
    setupEnvironment(flavor);
  }

  void updateEnvironment(AppFlavor newFlavor) {
    this.flavor = newFlavor;
    setupEnvironment(newFlavor);
  }

  String? get httpBaseUrl => _httpBaseUrl;

  @override
  void onInit() {
    setupEnvironment(flavor);
    _httpBaseUrl = httpClient.baseUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = const Duration(seconds: 15);
  }

  void setupEnvironment(AppFlavor flavor) {
    switch (flavor) {
      case AppFlavor.development:
        httpClient.baseUrl = ApiConstants.baseUrlDevelopment;
        break;
      case AppFlavor.production:
        httpClient.baseUrl = ApiConstants.baseUrlProduction;
        break;
    }
    _httpBaseUrl = httpClient.baseUrl;
  }
}
