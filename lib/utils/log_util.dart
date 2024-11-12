// ignore_for_file: non_constant_identifier_names, slash_for_doc_comments
import 'package:logger/logger.dart';

const String _tag = "easy_tab_controller";

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

LogT(String msg) {
  _logger.t("$_tag :: $msg");
}

/**
 * @description: DEBUG debug
 * @return {*}
 */
LogD(String msg) {
  _logger.d("$_tag :: $msg");
}

LogI(String msg) {
  _logger.i("$_tag :: $msg");
}

/**
 * @description: 警告 warning
 * @return {*}
 */
LogW(String msg) {
  _logger.w("$_tag :: $msg");
}

/**
 * @description: 错误 error
 * @return {*}
 */
LogE(String msg) {
  _logger.e("$_tag :: $msg");
}

LogF(String msg) {
  _logger.f("$_tag :: $msg");
}
