import "package:co_working/availablePage.dart";
import "package:flutter/material.dart";

import "package:google_fonts/google_fonts.dart";

class Slotdate extends StatefulWidget {
  const Slotdate({super.key});

  @override
  State createState() => _SlotDateState();
}

class _SlotDateState extends State {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
            childAspectRatio: 4.0, // Aspect ratio of the items
          ),
          itemCount: 10, // Number of items
          itemBuilder: (context, index) {
            int deskNumber = index;
            bool isOccupied = [1, 2, 4, 7]
                .contains(deskNumber); // Example of some occupied desks
            bool isSelected = deskNumber == 5; // Example of a selected desk

            return Tslots(
              deskNumber: deskNumber,
              isSelected: isSelected,
              isOccupied: isOccupied,
            );
          },
        ),
      ),
    );
  }
}

class Tslots extends StatelessWidget {
  final int deskNumber;
  final bool isSelected;
  final bool isOccupied;

  Tslots({
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

    List slots = [
      "10:00AM - 11:00AM",
      "11:00AM - 12:00PM",
      "01:00PM - 02:00PM",
      "02:00PM - 03:00PM",
      "04:00PM - 05:00PM",
      "05:00PM - 06:00PM",
      "06:00PM - 07:00PM",
      "07:00PM - 08:00PM",
      "08:00PM - 09:00PM",
      "09:00PM - 10:00PM"
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DeskBookingScreen()));
      },
      child: Container(
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
            slots[deskNumber],
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isOccupied
                  ? const Color.fromRGBO(246, 246, 246, 1)
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
