// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";

class DeskBookingScreen extends StatefulWidget {
  const DeskBookingScreen({super.key});
  @override
  State createState() => _DeskBookingScreenState();
}

class _DeskBookingScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available desks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wed 31 May, 05:00PM-06:00PM',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 40,
                itemBuilder: (context, index) {
                  int deskNumber = index + 1;
                  bool isOccupied = [
                    3,
                    5,
                    6,
                    7,
                    11,
                    13,
                    15,
                    17,
                    18,
                    20,
                    21,
                    23,
                    24,
                    25,
                    28,
                    30,
                    32,
                    33,
                    35,
                    36,
                    39,
                    40
                  ].contains(deskNumber); // Example of some occupied desks
                  bool isSelected =
                      deskNumber == 14; // Example of a selected desk

                  return Desk(
                    deskNumber: deskNumber,
                    isSelected: isSelected,
                    isOccupied: isOccupied,
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogBox();
                  },
                );
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(380, 60)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Colors.blue,
                  ),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text(
                'Book Desk',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Desk extends StatelessWidget {
  final int deskNumber;
  final bool isSelected;
  final bool isOccupied;

  Desk({
    required this.deskNumber,
    this.isSelected = false,
    this.isOccupied = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    if (isOccupied) {
      color = const Color.fromRGBO(227, 227, 227, 1);
    } else if (isSelected) {
      color = const Color.fromRGBO(81, 103, 235, 1);
    } else {
      color = const Color.fromRGBO(240, 245, 255, 1);
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: isOccupied
              ? const Color.fromRGBO(227, 227, 227, 1)
              : const Color.fromRGBO(199, 207, 252, 1),
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Center(
        child: Text(
          '$deskNumber',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: isOccupied
                ? const Color.fromRGBO(246, 246, 246, 1)
                : Colors.black,
          ),
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirm booking',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.cancel_sharp),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Desk ID: 123456',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 50),
              Text(
                'Desk: 14',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Slot: Wed 31 May, 05:00PM-06:00PM',
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add your onPressed code here
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(159, 34)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(81, 103, 235, 1),
                  ),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text(
                'Confirm',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
