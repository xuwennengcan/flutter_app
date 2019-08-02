import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum ToastType { SUCCESS, NORMAL, INFO, WARN, ERROR }

class ToastUtils {
  static showToast({@required String msg, ToastType type}) async {
    const toastPlugin = const MethodChannel('toast');

    final Map<String, dynamic> params = <String, dynamic>{
      "msg": msg,
    };

    String result = await toastPlugin.invokeMethod("toast", params);
  }
}
