import 'package:devices/Screens/list_devices.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
//    checkUserLoggedIn();
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Image.asset('assets/images/Compressor.jpg'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Navigator.of(context).pop(const SplashScreen());
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const ListScreen(), // => Lambda Function
      ),
    );
  }
}
