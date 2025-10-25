abstract class Validator{
  static String? validateName(String? name){
    if (name == null || name.trim().isEmpty) {
      return "Name is Required";
    }

    return null;
  }
  static String? validateEmail(String? email){
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "email is required";
    }
    if(!regExp.hasMatch(email)){
      return "E-mail Bad Format";
    }
    return null;

  }

  static String? validatePassword(String? password){
    RegExp regExp =  RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return "Password is required";
    }
    if(!regExp.hasMatch(password)){
      return "Weak Password";
    }
    return null;
  }

  static String? validateEventTitle(String? title){
    if(title == null || title.trim().isEmpty) return "Plz, enter event title";
    return null;
  }
  static String? validateEventDescription(String? description){
    if(description == null || description.trim().isEmpty) return "Plz, enter event description";
    return null;
  }
}