class ApiSettings {
  static const String _baseUrl = 'https://aroma.apex.ps/';
  static const String _apiBaseUrl = _baseUrl + 'api/';

  static const String register = _apiBaseUrl + 'register';
  static const String splash = _apiBaseUrl + 'splash';

  static const String registerWithEmail = _apiBaseUrl + 'register?email=';
  static const String registerWithMobile = _apiBaseUrl + 'register?mobile=';

  static const String activate = _apiBaseUrl + 'activate?active_code=';

  static const String home = _apiBaseUrl + 'home';
}
