abstract final class AppConfig {
  static const bool nodeDev = bool.fromEnvironment('NODE_DEV', defaultValue: true);
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:3000');
  static const bool useRemoteBackend = bool.fromEnvironment('USE_REMOTE_BACKEND', defaultValue: false);
}
