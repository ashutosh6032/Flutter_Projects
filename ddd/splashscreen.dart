import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Authentication/Authentication.dart';
import 'Authentication/Mapping.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MappingPage(
        auth: Auth(),
      ),
    ));
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('Images/Cover2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('Images/ddd.png'),
              ),
              Text(
                "Driver’s Drowsiness Detection",
                style: TextStyle(
                  fontFamily: "Satisfy",
                  color: Colors.lightBlueAccent[700],
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
