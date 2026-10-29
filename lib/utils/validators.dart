class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter passenger name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter mobile number';
    }
    final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.length != 10) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter age';
    }
    final age = int.tryParse(value.trim());
    if (age == null || age < 1 || age > 120) {
      return 'Enter valid age';
    }
    return null;
  }
}
