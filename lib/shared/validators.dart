String? validateEmail(String? value) {

  final regex = RegExp(pattern);

  return value == null || value == "" || !regex.hasMatch(value)
      ? 'Inserisci una mail valida!'
      : null;
}

String? validatePassword(String? value) {

  final regex = RegExp(pattern);

  return value == null || value == ""
      ? 'Inserisci una password!'
      : null;
}

String? validateName(String? value) {

  if(value == null || value == ""){
    return "Inserisci qualcosa!";
  } else if(value.length < 3){
    return "Inserisci almeno 3 lettere!";
  }
  return null;

}


const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';