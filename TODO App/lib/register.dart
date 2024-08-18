import "package:advance_todo_ui/login.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static String? name;
  static String? email;
  static String? password;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController compasswordController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  "Welcome Onboard",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's help you meet up your tasks",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: "Enter your name",
                            labelStyle:
                                const TextStyle(color: Color(0xff3D3B40)),

                            //  hintText: "Enter your name",
                            hintStyle: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            suffixIcon: const Icon(
                                Icons.account_circle_outlined,
                                color: Color(0xff80BCBD)),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
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
                        onFieldSubmitted: (value) {
                          email = value;
                        },
                        validator: (value) {
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
                        onFieldSubmitted: (value) {
                          password = value;
                        },
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, fontSize: 18),
                        cursorColor: const Color(0xff80BCBD),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        controller: compasswordController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                              color: Color(0xff80BCBD)),
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: const Color(0xff3D3B40)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(color: Colors.red)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Color(0xff80BCBD))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color(0xff80BCBD), width: 2.5)),
                        ),
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, fontSize: 18),
                        cursorColor: const Color(0xff80BCBD),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter correct password";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bool loginValidated =
                              formKey.currentState!.validate();
                          if (loginValidated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(" Registered Successfully"),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration Failed"),
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
                        child: Text("Register",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            )),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginPage())));
                              },
                              child: Text(
                                "Signin",
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
