

class Validator {

  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isMatchingPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool isPassword(String password) {
    return password.length >= 5;
  }
  
}