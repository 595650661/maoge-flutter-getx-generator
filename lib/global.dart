import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ducafecat_news_getx/common/services/services.dart';
import 'package:flutter_ducafecat_news_getx/store/store.dart';
import 'package:flutter_ducafecat_news_getx/utils/utils.dart';
import 'package:get/get.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
    Loading();

    // 异步注册，适用于如网络请求、读取本地文件等
    await Get.putAsync<StorageService>(() => StorageService().init());
    // 使用Get.put()来，【同步注册】一个控制器或者服务。
    // 适用于：初始化过程比较简单、不需要等待异步操作完成的对象。
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
