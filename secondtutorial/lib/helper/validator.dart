// matching various patterns for kinds of data
class Validator {
  Validator();

  String? email(String? value) {
    const String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.email';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    const String pattern = r'^.{6,}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.password';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    const String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.name';
    } else {
      return null;
    }
  }

  String? number(String? value) {
    const String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number';
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    const String pattern = r'^\d+$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount';
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    const String pattern = r'^\S+$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty';
    } else {
      return null;
    }
  }
}
