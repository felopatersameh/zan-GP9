import 'package:flutter/material.dart';

import '../../../../Config/screen_orientation_helper.dart';

import '../widgets/authentication_body.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void initState() {
    super.initState();
    AppScreenOrientationHelper.lockPortrait();
  }

  @override
  void dispose() {
    AppScreenOrientationHelper.unlockAllOrientations();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBody();
  }
}
