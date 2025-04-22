import 'package:flutter/material.dart';

class DashboardBoxConfig {
    final String title;
    final String subtitle;
    final Widget icon;
    final Color color;
    final String buttonText;

    const DashboardBoxConfig({
      required this.title,
      required this.subtitle, 
      required this.icon,
      required this.color,
      required this.buttonText,
    });
  }