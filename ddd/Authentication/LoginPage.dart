import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Authentication/SignUp.dart';
import 'ForgotPass.dart';
import '../Screen.dart';
import 'Authentication.dart';
import '../SOS/global.dart' as global;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.auth, required this.onSignedIn});
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late String email;
  late String password;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;

  _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Email or Password field is Empty'),
          actions: <Widget>[
            TextButton(
              // // splashColor: Colors.grey,
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

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user!;

    assert(!user.isAnonymous);

    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  Widget _signInButton() {
    return OutlinedButton(
      // splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const Methods();
              },
            ),
          );
        });
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      // highlightElevation: 0,
      // borderSide: BorderSide(color: Colors.grey),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("Images/google_logo.png"), height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('Images/Cover.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('Images/ddd.png'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 18.0),
                onChanged: (value) {
                  email = value;
                  global.email = value;
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
              TextField(
                controller: _passwordController,
                style: const TextStyle(fontSize: 18.0),
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.lock_open : Icons.lock_outline),
                    onPressed: _toggle,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: const TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  icon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    // splashColor: Colors.grey,
                    // color: Color(0xFF64DD03),
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        throw _showDialog(context);
                      }
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        global.number =
                            (await _asyncInputDialog(context)) as String;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Methods(),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    // elevation: 20.0,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),
                    // highlightElevation: 20.0,
                    // highlightColor: Colors.white,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 23.0,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  ElevatedButton(
                    // splashColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPassword();
                          },
                        ),
                      );
                    },
                    // elevation: 20.0,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),
                    // highlightElevation: 20.0,
                    // highlightColor: Colors.white,
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 13.5,
                          color: Colors.black),
                    ),
                    // color: Colors.blue[600],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: "Quando",
                      color: Colors.grey[500],
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    // splashColor: Colors.grey,
                    // color: Colors.orangeAccent[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUp();
                          },
                        ),
                      );
                    },
                    // elevation: 20.0,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),
                    // highlightElevation: 20.0,
                    // highlightColor: Colors.white,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  '----------OR----------',
                  style: TextStyle(
                      fontFamily: "Satisfy",
                      fontSize: 20.0,
                      color: Colors.cyanAccent[700]),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Future<String?>> _asyncInputDialog(BuildContext context) async {
  String emadd = global.email;
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
            'Dear $emadd please provide us with a mobile number which will be used to send a SOS alert'),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration: const InputDecoration(labelText: 'SOS No.'),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}
