import 'package:flutter/material.dart';

DropdownMenuItem<String> buildMenuItem(String item) =>
  DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );