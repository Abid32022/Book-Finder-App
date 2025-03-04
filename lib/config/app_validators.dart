

class AppValidator{

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field can not be empty';
    }
    // Check password length
    if (value.length < 8) {
      return 'Password can not be less the 8 characters and must include at least one capital letter, one number and one special character';
    }
    // Check for at least one number
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password can not be less the 8 characters and must include at least one capital letter, one number and one special character';
    }
    // Check for at least one special character
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password can not be less the 8 characters and must include at least one capital letter, one number and one special character';
    }
    // Check for at least one capital letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password can not be less the 8 characters and must include at least one capital letter, one number and one special character';
    }
    // Check for at least one small letter
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password can not be less the 8 characters and must include at least one capital letter, one number and one special character';
    }
    return null;
  }

  static String? confirmPasswordValidation(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password field can not be empty';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    bool isValidEmail(String value) {
      final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      return emailRegex.hasMatch(value);
    }

    if (value == null || value.isEmpty) {
      return 'Email field cannot be empty';
    }
    if (!isValidEmail(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Price is empty";
    }
    final numberRegex = RegExp(r'^\d+$');
    if (!numberRegex.hasMatch(value)) {
      return "Price only numbers are allowed";
    }
    int numericValue = int.parse(value);
    if (numericValue.toString().length > 7) {
      return "Price must be less than 7 digits";
    }
    return null;
  }

  static String? phoneNumberValidatorNotReq(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final phoneRegex =
    RegExp(r'^\+?\d{1,3}?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    if (!phoneRegex.hasMatch(value)) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s\-0-9@#!$%^&*_.]+$');
    if (!nameRegex.hasMatch(value)) {
      return "Only letters, spaces, hyphens, numbers, and special characters (@#!\$%^&*_.) are allowed in first name";
    }
    return null;
  }

  static String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(value)) {
      return "Only letters, spaces, and hyphens are allowed in last name";
    }
    return null;
  }

  // static String? phoneNumberValidatorReq(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Phone field cannot be empty";
  //   }
  //   if (value.length < 11) {
  //     return "Phone number can not be less then 11 digits";
  //   }
  //   if (value.length > 15) {
  //     return "Phone number can not be exceed then 15 digits";
  //   }
  //   final numberRegex = RegExp(r'^(\+92|0)(\d{3})(\d{7})$');
  //   if (!numberRegex.hasMatch(value)) {
  //     return "Phone number format is incorrect";
  //   }
  //   if (value.isAlphabetOnly) {
  //     return "Only number is required";
  //   }
  //   return null;
  // }


  static String? shopNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Shop name is required";
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s\-0-9@#!$%^&*_.]+$');
    if (!nameRegex.hasMatch(value)) {
      return "Only letters, spaces, hyphens, numbers, and special characters (@#!\$%^&*_.) are allowed in first name";
    }
    return null;
  }

  static String? websiteValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Website URL is required";
    }
    final websiteRegex = RegExp(r'^(https?://)?' // Optional protocol part.
    r'([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.[a-zA-Z]{2,63}(\/\S*)?$');
    if (!websiteRegex.hasMatch(value)) {
      return "Please enter a valid website URL";
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is required";
    }

    return null;
  }

  static String? staffValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Staff count is required";
    }
    try {
      int staffCount = int.parse(value);
      if (staffCount <= 0) {
        return "Staff count must be a positive number";
      }
    } catch (e) {
      return "Please enter a valid integer for staff count";
    }

    return null;
  }

  static String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Description is required";
    }
    return null;
  }

  static String? openingTimeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Opening Time is required";
    }
    final timeRegex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (!timeRegex.hasMatch(value)) {
      return "Please enter a valid time in 24-hour format (HH:MM)";
    }
    return null;
  }

  static String? closingTimeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Closing Opening Time is required";
    }
    final timeRegex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (!timeRegex.hasMatch(value)) {
      return "Please enter a valid time in 24-hour format (HH:MM)";
    }
    return null;
  }
}