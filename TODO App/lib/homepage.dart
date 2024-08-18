import "package:advance_todo_ui/login.dart";
import "package:flutter/material.dart";

import "package:google_fonts/google_fonts.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 240),
              Container(
                  height: 200,
                  width: 300,
                  child: Image.asset("assets/notebook.gif")),
              const SizedBox(height: 100),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Gets things with TODo",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w700, fontSize: 25),
                              /*   TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25,
                                        fontStyle: FontStyle.italic) */
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Capture tasks Add your mustdos,big small to your list Prioritize & organize Arrange them by due date importance or category.",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),

                              /* TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic)*/
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginPage())));
                              },
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(300, 50)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xff80BCBD),
                                  ),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)))),
                              child: Text("Get Started",
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
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
