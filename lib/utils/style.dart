import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);

TextStyle HeadText7(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 13,
    fontFamily: 'popins',
    fontWeight: FontWeight.bold,
  );
}

InputDecoration AppInputDeceration(label) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    labelText: label,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    fillColor: Colors.white38,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

TextStyle ButtonTextStyle() {
  return TextStyle(
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.bold,
      color: Colors.black);
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: ButtonTextStyle(),
      ),
    ),
  );
}
