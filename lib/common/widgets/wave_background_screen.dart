import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_sign_up/common/stores/app_store.dart';
import 'package:sign_in_sign_up/service_locator.dart';

import '../../core/config/constants/app_assets.dart';

class WaveBackgroundScreen extends StatelessWidget {
  const WaveBackgroundScreen({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24.0, top: 24),
                          child: SvgPicture.asset(AppSvgs.logo),
                        ),
                        Spacer(),
                        Observer(
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Switch(
                                    thumbColor: WidgetStateProperty.all(
                                      Colors.green,
                                    ),
                                    value: locator<AppStore>().themeMode == 0,
                                    onChanged: (value) {
                                      locator<AppStore>()
                                          .setThemeMode(value ? 0 : 1);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  child ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.3);

    path.quadraticBezierTo(size.width * 0.60, size.height * 0.23,
        size.width * 0.63, size.height * 0.23);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.22, size.width, size.height * 0.3);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
