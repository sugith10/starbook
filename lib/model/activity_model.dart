import 'package:flutter/material.dart';

class ActivityModel {
  final String emoji;
  final String text;
  final Color color;
  final List<String> ruleList;

  ActivityModel({
    required this.emoji,
    required this.text,
    required this.color,
    required this.ruleList,
  });
}
