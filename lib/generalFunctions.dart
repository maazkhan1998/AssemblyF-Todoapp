

import 'package:fluttertoast/fluttertoast.dart';

showToast(String message){
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message,gravity: ToastGravity.BOTTOM,);
}