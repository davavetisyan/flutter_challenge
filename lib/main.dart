import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sign_in_sign_up/common/stores/app_store.dart';
import 'package:sign_in_sign_up/core/config/theme/app_theme.dart';
import 'package:sign_in_sign_up/core/route/app_navigations.dart';
import 'package:sign_in_sign_up/core/route/routes.dart';
import 'package:sign_in_sign_up/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Challenge',
        themeMode: locator<AppStore>().themeMode == 0
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: AppTheme.standart,
        darkTheme: AppTheme.dartkTheme,
        onGenerateRoute: AppRoute().generateRoute,
        initialRoute: RouteLink.splash,
      ),
    );
  }
}
