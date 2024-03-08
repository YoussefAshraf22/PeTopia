//this config file will include our API url and endpoints
class Config {
  static const String appName = 'Zootopia';
  //the API link should I get from backend
  static const String apiURL = '10.0.0.7:4000';
  //endpoints of API for login
  static const loginAPI = "/users/login";
  static const registerAPI = "/users/register";
  static const userProfileAPI = "/users/user-Profile";
}
