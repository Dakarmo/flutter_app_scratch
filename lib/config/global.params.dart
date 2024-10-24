import 'package:flutter/material.dart';

class GlobalParams {

  static List<Map<String, dynamic>> menus = [
    {
      "title": "Home", "icon": Icons.home, "route": "/home"
    },
    {
      "title": "Météo", "icon": Icons.wb_sunny, "route": "/meteo"
    },
    {
      "title": "Galerie", "icon": Icons.storage, "route": "/galerie"
    },
    {
      "title": "Counter", "icon": Icons.calculate, "route": "/counter"
    },
    {
      "title": "Github Users", "icon": Icons.person, "route": "/githubapi"
    },
  ];
}

