import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_overlay_window/my_overlay_window.dart';

class TextFieldOverlay extends StatefulWidget {
  const TextFieldOverlay({Key? key}) : super(key: key);

  @override
  State<TextFieldOverlay> createState() => _TextFieldOverlayState();
}

class _TextFieldOverlayState extends State<TextFieldOverlay> {
  @override
  void initState() {
    super.initState();
    MyOverlayWindow.overlayListener.listen((event) {
      log("$event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) async {
        if (hasFocus) {
          await MyOverlayWindow.updateFlag(OverlayFlag.focusPointer);
        } else {
          await MyOverlayWindow.updateFlag(OverlayFlag.defaultFlag);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(hintText: "Write anything"),
                ),
                const SizedBox(height: 50.0),
                TextButton(
                  onPressed: () {
                    MyOverlayWindow.closeOverlay();
                  },
                  child: const Text("Close Overlay"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
