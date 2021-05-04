

class TextValidators {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu correo electronico';
    }
    if (_validateEmail(value)) {
      return 'Ingresa un correo valido';
    }
    return null;
  }

  static String? documentValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu numero de identificacion';
    } else if (value.length < 6) {
      return 'Revisa numero de identificacion';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener 6 o mas caracteres';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? password2){
    if (password!.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    if (password.length < 6) {
      return 'La contraseña debe tener 6 o mas caracteres';
    }
    if (password != password2){
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tus nombres';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa numero de telefono';
    }
    if (value.length < 10) {
      return 'Revisa numero de telefono';
    }
    return null;
  }

  static String? neighborhoodValidator(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu barrio';
    }
    return null;
  }

  static String? textMandatoryValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo no debe ir vacio';
    }
    return null;
  }

  static bool _validateEmail(String value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    return !regex.hasMatch(value);
  }
}
