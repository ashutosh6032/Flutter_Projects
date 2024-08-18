import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './FaceDetection/FaceDetection.dart';
import './SOS/fightBack.dart';
import './SOS/helplineNumbers.dart';
import './SOS/SOS.dart';
import './Map/home.dart';
import './SOS/reportCrime.dart';
import 'Custom Button.dart';

class Methods extends StatefulWidget {
  const Methods({super.key});

  @override
  _MethodsState createState() => _MethodsState();
}

class _MethodsState extends State<Methods> {
  void _logout() async {
    try {} catch (e) {
      print(e);
    }
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        getLocation();
      }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FightBack()),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelplineNumbers()),
        );
      }
      if (index == 3) {
        reportCrime();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            'Driver Drowsiness Detection',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black87,
              fontFamily: "Satisfy",
            ),
          ),
          actions: const <Widget>[
            // TextButton.icon(
            //   onPressed: _logout,
            //   icon: Icon(Icons.exit_to_app),
            //   label: Text("Logout",
            //       style: TextStyle(
            //           fontFamily: "Quando",
            //           fontSize: 18.0,
            //           color: Colors.black)),
            // ),
          ],
          backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('Images/Cover4.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                      ),
                      CustomButton(
                        heading: 'Map',
                        function: HomePage(),
                        icon: 'Images/Map.png',
                      ),
                      CustomButton(
                        heading: 'Detect Drowsiness',
                        function: FaceDetection(),
                        icon: 'Images/Eye.png',
                      ),
                      // CustomButton(
                      //   heading: 'Register User',
                      //   function: BecomeSafeguide(),
                      //   icon: 'Images/User.png',
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal[100],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.announcement,
                size: 25,
                color: Colors.redAccent,
              ),
              label: 'SOS',
              // title: Text(
              //   'SOS',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.redAccent,
              //   ),
              // ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.reply,
                size: 25,
                color: Colors.lightBlue,
              ),
              label: 'Learn',
              // title: Text(
              //   'Learn',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.lightBlue,
              //   ),
              // ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.yellow,
                size: 25,
              ),
              label: 'Helpline',
              // title: Text(
              //   'Helpline',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.yellow,
              //   ),
              // ),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.report,
            //     color: Colors.green,
            //     size: 25,
            //   ),
            //   label: "Report",
            //   // title: Text(
            //   //   'Report',
            //   //   style: TextStyle(color: Colors.green, fontSize: 18),
            //   // ),
            // ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
