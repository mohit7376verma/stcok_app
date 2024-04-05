
import 'constants.dart';

String? validateMobileNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return "Please enter mobile number!";
  } else if (value.length < 7 || value.length > 11) {
    return "Please enter valid mobile number!";
  } else {
    return null;
  }
}
/*
String? validatePassword(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "'Please enter password!";
  } else if (!RegExp(kPasswordPattern).hasMatch(value.trim())) {
    return "Password must contain capital letter, small letter, number & an special character [!,@,#,\$,%,^,&,*,_]";
  } else {
    return null;
  }
}*/


String? validatePassword(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter password!";
  } else if (value.length < 8){
    return "Password must be eight digits!";
  } else{
    return null;
  }
}

String? validateOldPassword(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter old password!";
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter confirm password!";
  } /*else if (!RegExp(kPasswordPattern).hasMatch(value.trim())) {
    return "Password must contain capital letter, small letter, number & an special character [!,@,#,\$,%,^,&,*,_]";
  } */else if (value != password) {
    return "Both passwords should be matched!";
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter email address!";
  } else if (!RegExp(kEmailPattern).hasMatch(value.trim())) {
    return "Please enter valid email address!";
  } else {
    return null;
  }
}

/*String? validateCardMonth(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter card month!";
  } else {
    var month = DateFormat("MM/y").parse(getFormattedCardMonth(value));
    if (month.isBefore(DateTime.now()) || month.isAfter(DateTime.now().add(const Duration(days: 365 * 50)))) {
      return "Please enter valid card month!";
    } else {
      return null;
    }
  }
}*/

String? validateCardNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter card number!";
  } else {
    var number = value.replaceAll(" ", "");
    if (number.length < 12 || number.length > 20) {
      return "Please enter valid card number!";
    } else {
      return null;
    }
  }
}

String? validateCvv(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Enter CVV";
  } else if (value.length < 3 || value.length > 4) {
    return "Please enter valid CVV!";
  } else {
    return null;
  }
}

String? validateCardHolderName(String? value) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return "Please enter card holder name!";
  } else {
    return null;
  }
}

String? validateFiled(String? value, String? error) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return error;
  } else {
    return null;
  }
}

String? validateAccountNumber(String? value, String? error) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return error;
  } else if (value.length < 9) {
    return "Please enter the valid account number!";
  }
  return null;
}

String? validateCharacterLength(String? value, int length) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return "This field is empty";
  } else if (value.length < length) {
    return "It should be more then $length character";
  }
  return null;
}

String? validateSSNNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Enter the SSN number";
  } else if (value.length != 9) {
    return "Enter Valid SSN number 9 character";
  } else {
    return null;
  }
}

String? validateRoutingNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Enter the Routing number";
  } else if (value.length != 9) {
    return "Enter Valid Routing number";
  } else {
    return null;
  }
}

String? validateAccountHolderName(String? value) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return "Please enter account holder name!";
  } else {
    return null;
  }
}

/*String? validateAccountNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterAccountNumber;
  } else if (value.length < 12) {
    return S.current.pleaseEnterValidAccountNumber;
  } else {
    return null;
  }
}*/

String? nameValidateFiled(String? value, String? error) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return error;
  } else if (value.length < 4) {
    return "It should be more then 3 letter";
  } else {
    return null;
  }
}

String? validateReEnterAccountNumber(String? value, String accountNumber) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return "Please enter the account number";
  } else if (value != accountNumber) {
    return "Both account number should be matched!";
  } else {
    return null;
  }
}

String? validateAmount(String? value) {
  if (value == null) {
    return null;
  } else if (value.trim().isEmpty) {
    return "Please enter amount!";
  } else {
    return null;
  }
}
