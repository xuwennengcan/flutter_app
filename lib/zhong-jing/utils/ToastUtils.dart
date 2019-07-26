import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { SUCCESS, NORMAL, INFO, WARN, ERROR }

class ToastUtils {
  static showToast({@required String msg, ToastType type}) async {
    Fluttertoast.showToast(msg: msg);
  }
}
