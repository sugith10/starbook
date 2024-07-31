import 'package:flutter/material.dart';
import 'package:star_book/model/activity_model.dart';

class ActivityData {
  static final List<ActivityModel> list = [
    ActivityModel(
      text: "تلاوة القران",
      emoji: "📖",
      color: const Color(0xFFFFEE93),
      ruleList: [],
    ),
    ActivityModel(
      text: "دراسة",
      emoji: "✏️",
      color: const Color(0xFFBDE0FE),
      ruleList: [],
    ),
    ActivityModel(
      text: "عداد",
      emoji: "🤲",
      color: const Color(0xFFADF7B6),
      ruleList: [],
    ),
    ActivityModel(
      text: "صلاة الصبح",
      emoji: "📿",
      color: const Color(0xFFFFC09F),
      ruleList: ["قضاء", "اداع", "لا"],
    ),
    ActivityModel(
      text: "صلاة الظهر",
      emoji: "📖",
      color: const Color(0xFFF3C4FB),
      ruleList: ["قضاء", "اداع", "لا"],
    ),
    ActivityModel(
      text: "صلاة العصر",
      emoji: "✏️",
      color: const Color(0xFFCADABF),
      ruleList: ["قضاء", "اداع", "لا"],
    ),
    ActivityModel(
      text: "صلاة المغرب",
      emoji: "🤲",
      color: const Color.fromARGB(255, 255, 237, 158),
      ruleList: ["قضاء", "اداع", "لا"],
    ),
    ActivityModel(
      text: "صلاة العشاء",
      emoji: "📿",
      color: const Color.fromARGB(255, 224, 250, 146),
      ruleList: ["قضاء", "اداع", "لا"],
    ),
  ];

  static const List<String> ruleList = ["قضاء", "اداع", "لا"];
}
