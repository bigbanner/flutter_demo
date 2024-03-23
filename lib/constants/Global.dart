class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  
  factory TokenManager() {
    return _instance;
  }
  
  TokenManager._internal();
  
  String? _token;
  
  void setToken(String token) {
    _token = token;
  }
  
  String? get token => _token;
}