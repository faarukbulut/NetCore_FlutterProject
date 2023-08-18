import 'package:flutter/material.dart';
import 'colors.dart';

GestureDetector butonWidget(Function fonksiyon, String butonText) {
  return GestureDetector(
    onTap: (){fonksiyon();},
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(butonText, style: const TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}

InputDecoration textFieldDecoration(String hintText){
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kPrimaryLight,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kPrimaryLight,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kPrimaryLight,
      ),
    ),
    filled: true,
    fillColor: kPrimaryLight,
  );
}
