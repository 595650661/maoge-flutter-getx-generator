import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/langs/translation_service.dart';
import 'package:flutter_ducafecat_news_getx/routers/pages.dart';
import 'package:flutter_ducafecat_news_getx/store/store.dart';
import 'package:flutter_ducafecat_news_getx/style/style.dart';
import 'package:flutter_ducafecat_news_getx/utils/utils.dart';
import 'package:flutter_ducafecat_news_getx/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> main() async {
  // 初始化
  await Global.init();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 设计图尺寸
      designSize: Size(375, 812),
      builder: () => RefreshConfiguration(
        // 设置全局刷新配置   pull_to_refresh
        headerBuilder: () => ClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        maxOverScrollExtent: 100,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: 'News',
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL, //初始路由
          getPages: AppPages.routes, //路由
          builder: EasyLoading.init(),
          translations: TranslationService(), //国际化
          navigatorObservers: [AppPages.observer],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: ConfigStore.to.languages,
          locale: ConfigStore.to.locale,
          fallbackLocale: Locale('en', 'US'),
          enableLog: true,
          logWriterCallback: Logger.write,
        ),
      ),
    );
  }
}
