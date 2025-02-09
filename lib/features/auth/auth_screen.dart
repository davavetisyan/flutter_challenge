import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/common/repositories/auth_repository.dart';
import 'package:sign_in_sign_up/core/config/theme/app_colors.dart';
import 'package:sign_in_sign_up/core/route/routes.dart';
import 'package:sign_in_sign_up/features/auth/login.dart';
import 'package:sign_in_sign_up/features/auth/sign_up.dart';
import 'package:sign_in_sign_up/features/auth/stores/login_store.dart';
import 'package:sign_in_sign_up/service_locator.dart';

import '../../common/stores/app_store.dart';
import '../../common/widgets/wave_background_screen.dart';
import 'stores/sign_up_store.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  late final PageController _pageController;
  late final LoginStore _loginStore;
  late final SignUpStore _signUpStore;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );

    _loginStore = LoginStore(
      locator<AuthRepository>(),
      locator<AppStore>().setCurrentUser,
    );
    _signUpStore = SignUpStore(locator<AuthRepository>(), (user) {
      locator<AppStorage>().saveUser(user);
      _currentIndex.value = 0;
      _pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WaveBackgroundScreen(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  allowImplicitScrolling: true,
                  controller: _pageController,
                  onPageChanged: (value) {
                    _currentIndex.value = value;
                  },
                  children: [
                    Login(
                      store: _loginStore,
                    ),
                    SignUp(
                      store: _signUpStore,
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 342,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentIndex,
                  builder: (context, value, child) {
                    final double leftValue = _currentIndex.value == 0 ? 0 : 171;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          left: leftValue,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            height: 40,
                            width: 171,
                            decoration: BoxDecoration(
                              color: AppColors.activeTabBar,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: null,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  if (_currentIndex.value != 0) {
                                    _currentIndex.value = 0;
                                    _pageController.animateToPage(
                                      0,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                    return;
                                  }

                                  await _loginStore.login();

                                  if (locator<AppStore>().currentUser != null) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      RouteLink.home,
                                      (route) => true,
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: _currentIndex.value == 0
                                        ? AppColors.white
                                        : Theme.of(context)
                                            .colorScheme
                                            .surfaceDim,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  if (_currentIndex.value != 1) {
                                    _currentIndex.value = 1;
                                    _pageController.animateToPage(
                                      1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                    return;
                                  }

                                  await _signUpStore.signUp();
                                },
                                child: Text(
                                  'Sign-up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: _currentIndex.value == 1
                                        ? AppColors.white
                                        : Theme.of(context)
                                            .colorScheme
                                            .surfaceDim,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 42,
              ),
              RepaintBoundary(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: AppColors.activeTabBar,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
