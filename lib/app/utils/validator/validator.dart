class Validator {
  bool validateEmail(String value) {
    if (value.length == 0) {
      return false;
    } else if (value.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length == 0) {
      return "Không được bỏ trống";
    } else if (value.length < 6) {
      return "Không được ít hơn 6 ký tự";
    } else {
      return null;
    }
  }
}
