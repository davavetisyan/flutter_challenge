import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/common/stores/app_store.dart';
import 'package:sign_in_sign_up/common/widgets/wave_background_screen.dart';
import 'package:sign_in_sign_up/core/route/routes.dart';
import 'package:sign_in_sign_up/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        if (locator<AppStore>().currentUser != null) {
          Navigator.pushReplacementNamed(context, RouteLink.home);
        } else {
          Navigator.pushReplacementNamed(context, RouteLink.auth);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WaveBackgroundScreen();
  }
}
