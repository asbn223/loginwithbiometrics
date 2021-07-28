class Validator {
  static String nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Full Name is required";
    }
    if (value.trim().length < 8) {
      return "Please enter your full name";
    }
    return "";
  }

  static String phoneValidator(String value) {
    if (value.isEmpty) {
      return "Phone Number is required";
    }
    if (value.length < 10) {
      return "Phone Number must be at least 10 characters";
    }
    return "";
  }

  static String emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Email is not valid";
    }
    return "";
  }

  static String passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return "";
  }
}
