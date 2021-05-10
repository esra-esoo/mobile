class Config {
  static const devAuthEndpoint = 'https://mobile.tatweer.ly:5001';
  static const devEndpoint = 'https://mobile.tatweer.ly:44356';
////////////////
  static const prodAuthEndpoint = 'https://mobile.tatweer.ly:5001';
  static const prodEndpoint = 'https://mobile.tatweer.ly:44356';

  static const identifier = 'mobile.client';
  static const secret = '44f37caf-831a-45b8-92a4-8d829f36beb5';
  static const scopes = [
    'phone',
    'customergate.fullaccess',
    'customerApi.fullaccess',
    'offline_access',
    'IdentityServerApi',
  ];
}
