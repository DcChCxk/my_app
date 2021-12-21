import 'package:flutter/material.dart';
import 'package:my_app/ui/splash_page.dart';

import 'base/page/current_locale.dart';
import 'base/page/theme_model.dart';
import 'base/res/constant.dart';
import 'base/utils/app_theme.dart';
import 'generated/l10n.dart';
import 'ui/home_page.dart';
import 'ui/login/login_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:fluwx/fluwx.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CurrentLocale()), //此是语言状态注册
      ChangeNotifierProvider(create: (context)=>ThemeModel()),//此是主题状态注册
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // 用于路由返回监听
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final easyLoad = EasyLoading.init();
    //状态组件绑定,将语言状态与组件绑定
    return Consumer2<ThemeModel,CurrentLocale>(//语言设置1：语言状态获取方式
        builder: (context,themeModel, currentLocale, child) {
      return MaterialApp(
          title: 'My APP',
          routes: {
            Constant.routeMain: (ctx) => HomePage(0),
            Constant.routeLogin: (ctx) => LoginPage()
          },
          locale: currentLocale.value,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: AppTheme.getThemeData(themeModel.value),
          // 隐藏DEBUG
          debugShowCheckedModeBanner: false,
          //引导页,
          home: const SplashPage(),
          builder: (context, child) {
            child = easyLoad(context, child);
            return child;
          });
    });
  }

}
