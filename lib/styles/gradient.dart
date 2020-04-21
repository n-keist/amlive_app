import 'package:flutter/material.dart';

enum TopicGradient { GREENBLUE, PURPLE, YELLOW, ORANGE, GREEN }

class TopicGradientImp {
  Map<TopicGradient, List<Color>> gradients = {
    TopicGradient.GREENBLUE: [
      Color(0xff36d1dc),
      Color(0xff5b86e5),
    ],
    TopicGradient.PURPLE: [
      Color(0xff6441A5),
      Color(0xff2a0845),
    ],
    TopicGradient.YELLOW: [
      Color(0xffffb347),
      Color(0xffffcc33),
    ],
    TopicGradient.ORANGE: [
      Color(0xfffe8c00),
      Color(0xfff83600),
    ],
    TopicGradient.GREEN: [
      Color(0xff134e5e),
      Color(0xff71b280),
    ]
  };
}
