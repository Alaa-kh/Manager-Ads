class AppApi {
  // Base URL for the API
  static const String _baseUrl = 'https://srv812456.hstgr.cloud/api/';

  static const String login = '${_baseUrl}auth/login';
  static const String verify = '${_baseUrl}verify-email';
  static const String forgotPassword = '${_baseUrl}forgot-password';

  static const String addAds = '${_baseUrl}dashboard/dash-ads';


}
