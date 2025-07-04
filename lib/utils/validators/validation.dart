class TValidator {

  // Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value){
    if (value == null || value.isEmpty){
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required';
    }

    // Check for minimum password length
    if(value.length < 7){
      return 'Password must be at least 7 characters long';
    }

    // Check for Uppercase letters
    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must contain at least one uppercase';
    }

    // Check for numbers
    if(!value.contains(RegExp(r'[0-9]'))){
      return 'Password must contain at least one number.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return 'Phone number is required.';
    }

    final phoneRegExp = RegExp(r'^\d{12}$');

    if(!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format';
    }
    return null;
  }
}