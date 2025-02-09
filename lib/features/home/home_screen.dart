import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/common/stores/app_store.dart';
import 'package:sign_in_sign_up/common/widgets/wave_background_screen.dart';
import 'package:sign_in_sign_up/service_locator.dart';

import '../../core/route/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WaveBackgroundScreen(
      child: Column(
        children: [
          Column(children: [
            RichText(
              text: TextSpan(
                text: 'Welcome ',
                style: TextStyle(fontSize: 28, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '${locator<AppStore>().currentUser!.username}!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                locator<AppStore>().logOut();
                Navigator.pushReplacementNamed(context, RouteLink.auth);
              },
              child: Text('Logout'),
            ),
          ])
        ],
      ),
    );
  }
}
