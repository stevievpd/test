import './http_exception.dart';

class AuthException extends HttpException {
  static const _errorCode = {
    'EMAIL_EXISTS': 'This email address is already in use.',
    'INVALID_EMAIL': 'This is not a valid email address',
    'WEAK_PASSWORD': 'This password is too weak.',
    'EMAIL_NOT_FOUND': 'Could not find a user with that email.',
    'INVALID_PASSWORD': 'Invalid Password',
    'PASSWORD_TOO_SHORT': 'Password is too short!',
    'PASSWORDS_NOT_MATCH': 'Passwords do not match!',
  };

  AuthException(String message) : super(message);

  static String get emailExists {
    return _errorCode['EMAIL_EXISTS'].toString();
  }

  static String get emailInvalid {
    return _errorCode['INVALID_EMAIL'].toString();
  }

  static String get emailNotFound {
    return _errorCode['EMAIL_NOT_FOUND'].toString();
  }

  static String get weakPassword {
    return _errorCode['WEAK_PASSWORD'].toString();
  }

  static String get passwordInvalid {
    return _errorCode['INVALID_PASSWORD'].toString();
  }

  static String get passwordTooShort {
    return _errorCode['PASSWORD_TOO_SHORT'].toString();
  }

  static String get passwordsNotMatch {
    return _errorCode['PASSWORDS_NOT_MATCH'].toString();
  }

  String get description {
    var errDescription = 'Authentication failed.\nReason unknown.';
    for (String key in _errorCode.keys) {
      if (message.contains(key)) {
        return _errorCode[key].toString();
      }
    }
    return errDescription;
  }
}
