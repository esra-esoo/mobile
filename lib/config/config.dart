class Config {
  static const authorizationEndpoint =
      'https://mobile.tatweer.ly:5001/connect/token';

  static const identifier = 'mobile.client';
  static const secret = '44f37caf-831a-45b8-92a4-8d829f36beb5';
  static const scopes = [
    'phone',
    'customergate.fullaccess',
    'customerApi.fullaccess',
    'offline_access',
  ];
}
