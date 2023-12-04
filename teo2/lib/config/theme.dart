import 'package:flutter/material.dart';

class AppTheme{
  AppTheme({this.selectedColor = 0});

  int selectedColor;

  //Lista de colores para seleccionar
  List<Color> colorThemes = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.cyanAccent
  ];

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
    );
  }
}