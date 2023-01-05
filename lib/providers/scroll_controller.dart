// ignore: file_names
import 'package:flutter/material.dart';

ScrollController controller = ScrollController();

class ScrollControl {
  void scrollDown() {
    if (controller.hasClients) {
      controller.jumpTo(controller.position.maxScrollExtent);
    }
  }
}
