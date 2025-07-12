class InputValidator {
  static String? isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return 'Password must be filled';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      return 'Email invalid';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password must be filled';
    } else if (password.length < 8) {
      return 'password at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'passwords must contain capital letters';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'passwords must contain numbers';
    } else if (!RegExp(r'[!@#$&*~]').hasMatch(password)) {
      return 'passwords must contain special characters (!@#\$&*~)';
    }
    return null;
  }

  static String? isUserValidUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username must be filled';
    }

    return null;
  }

  static String? isValidInput(String? input) {
    if (input == null || input.isEmpty) {
      return '$input can\'t be null';
    }
    return null;
  }
}
