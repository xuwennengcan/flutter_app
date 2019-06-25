import 'package:flutter/material.dart';

class Toast {
  OverlayState overlayState;
  OverlayEntry overlayEntry;

  OverlayState getToast(BuildContext context, String string) {
    if (overlayState == null) overlayState = Overlay.of(context);
    if (overlayEntry == null)
      overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Positioned(
                child: Text(string),
              ));
    //移除
    overlayEntry.remove();
    return overlayState;
  }

  void addToast(BuildContext context, String string) {
    getToast(context, string).insert(overlayEntry);
  }
}
