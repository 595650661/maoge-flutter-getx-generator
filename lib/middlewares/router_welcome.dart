import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/routers/routes.dart';
import 'package:flutter_ducafecat_news_getx/store/store.dart';
import 'package:flutter_ducafecat_news_getx/utils/utils.dart';

import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == true) {
      LogD('redirect -> 欢迎页面');
      return null;
    } else if (UserStore.to.isLogin == true) {
      LogD('redirect -> 首页');
      return RouteSettings(name: AppRoutes.Application);
    } else {
      LogD('redirect -> 登录页');
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
