import 'dart:ui';
import 'package:flutter/material.dart';

class ShowDialogWidget extends StatelessWidget {
  final Widget? title;
  final List<Widget> content;
  final List<Widget> actions;

  const ShowDialogWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: AlertDialog(
          titlePadding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          actionsPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
          title: title,
          content: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: content)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [Row(children: actions)],
        ));
  }
}
