import 'package:flutter/material.dart';

import '../../models/nav_item.dart';

sealed class AppLists{

  static const List<NavItem> navItems = [
    NavItem(icon: Icons.link, label: "Website"),
    NavItem(icon: Icons.upload_file, label: "Upload a file"),
    NavItem(icon: Icons.message_outlined, label: "Text message"),
    NavItem(icon: Icons.image_outlined, label: "Image"),
    NavItem(icon: Icons.camera, label: "Google Doc"),
    NavItem(icon: Icons.camera_alt_outlined, label: "Instagram"),
    NavItem(icon: Icons.facebook, label: "Facebook"),
    NavItem(icon: Icons.play_circle_outline, label: "YouTube"),
    NavItem(icon: Icons.wifi, label: "Wifi"),
    NavItem(icon: Icons.email, label: 'Email'),
  ];

  static const List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Colors.blue,
    Colors.green
  ];

  static const List<String> shapes = [
    "Circle",
    "Square"
  ];

  static const List<AssetImage> logos =  [
    AssetImage("assets/logos/telegram.png"),
    AssetImage("assets/logos/linkedin.png"),
    AssetImage("assets/logos/github.png"),
    AssetImage("assets/logos/instagram.png")
  ];

  static const List<String> pngSvgJpg = [
    "PNG",
    "JPG",
    "SVG"
  ];
}