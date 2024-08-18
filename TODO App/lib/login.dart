import "package:advance_todo_ui/advancetodo.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "register.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String? email;
  static String? password;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> loginKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Form(
          key: loginKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/loginimg.png",
                  height: 130,
                  //width: 200,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.email_outlined,
                                color: Color(0xff80BCBD)),
                            labelText: "Enter your email",
                            // hintText: "Enter your email",
                            // hintStyle: GoogleFonts.quicksand(
                            //   fontWeight: FontWeight.w600,
                            //   fontSize: 18,
                            // ),
                            labelStyle:
                                const TextStyle(color: Color(0xff3D3B40)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Color(0xff80BCBD))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                    color: Color(0xff80BCBD), width: 2.5))),
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, fontSize: 18),
                        cursorColor: const Color(0xff80BCBD),
                        onSaved: (value) {
                          email = value;
                        },
                        validator: (value) {
                          //print(RegisterPage.email);
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xff80BCBD)),
                            hintText: "Enter Password",
                            hintStyle: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color(0xff3D3B40)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    const BorderSide(color: Color(0xff80BCBD))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                    color: Color(0xff80BCBD), width: 2.5))),
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, fontSize: 18),
                        cursorColor: const Color(0xff80BCBD),
                        onSaved: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          } /* else if (value.length < 8) {
                            return "Password should be min 8 char";
                          } */
                          else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text("Forgot Password",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff80BCBD))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool loginValidated =
                              loginKey.currentState!.validate();
                          if (loginValidated) {
                            if (email != RegisterPage.email) {}
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdvanceTodo()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Failed"),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(300, 50)),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xff80BCBD),
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                        child: Text("Login",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            )),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have Account?",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: -5,
            left: -5,
            child: Image.asset(
              "assets/eclipes.png",
            )),
        /*    Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/neotebook.gif")),*/
      ]),
    );
  }
}
