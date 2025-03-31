class InputValidator {
  static bool isEmailValid(String email) {
    if (email.isEmpty) {
      return false;
    }
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.isEmpty) {
      return false;
    }
    return RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }

  static bool isUserValidUsername(String username) {
    return username.isNotEmpty;
  }
}
