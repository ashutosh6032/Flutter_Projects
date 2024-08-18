import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String email;
  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Reset Password Link Is Sent To Your Email_ID'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginPage(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(
          child: Text(
            'Reset Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.black87,
              fontFamily: "Satisfy",
            ),
          ),
        ),
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('Images/Cover5.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Image(
              image: AssetImage('Images/ddd.png'),
            ),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(fontSize: 18.0),
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: const TextStyle(
                    fontSize: 17.0,
                    fontFamily: "Quando",
                    color: Colors.blueAccent),
                hintText: 'Enter Email',
                labelText: 'Email',
                labelStyle: const TextStyle(
                    fontSize: 17.0,
                    fontFamily: "Quando",
                    color: Colors.blueAccent),
                icon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              // // splashColor: Colors.grey,
              onPressed: () {
                _auth.sendPasswordResetEmail(email: email);
                throw _showDialog(context);
              },
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              // ),
              child: const Text(
                'CONFIRM',
                style: TextStyle(
                    fontFamily: "Quando", fontSize: 20.0, color: Colors.black),
              ),
              // color: Colors.greenAccent[700],
            ),
          ],
        ),
      ),
    );
  }
}
