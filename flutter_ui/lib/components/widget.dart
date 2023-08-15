import 'package:flutter/material.dart';
import 'package:get/get.dart';

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