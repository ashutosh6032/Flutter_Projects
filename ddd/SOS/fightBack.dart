import 'package:flutter/material.dart';

class FightBack extends StatelessWidget {
  const FightBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              'Guidelines for Driving',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black87,
                fontFamily: "Satisfy",
              ),
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('Images/Cover5.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 200, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Text(
                  'Learn to drive safely:',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey[700],
                    fontFamily: "Satisfy",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '1. Obey all speed limits and signs.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '2. Be attentive and drive responsibly.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '3. Never drive under the influence of alcohol or drugs.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '4. Always wear your seatbelts.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '5.Before driving a car, do a simple safety check. Turn on the lights and walk around the vehicle to ensure that all lights are in working order. Also check your blinkers for proper operation. Look for any fluid leaks or things hanging from the vehicle. Check that the tires are properly inflated. ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '6. Always drive with your headlights on, a car is visible for nearly four times the distance with it\'s headlights on.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '7. Always use your turn signals.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '8. When stopping at a stop sign, spell S-T-O-P to yourself before proceeding. Always turn your head to look left, then right, straight ahead, then left again before proceeding.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '9. Keep your eyes moving. Notice what is happening on the sides of the road and check behind you through your mirrors every 6-8 seconds.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '10. When being approached by an emergency vehicle, pull to the right shoulder of the road and stop.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ]));
  }
}
