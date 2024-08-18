import 'package:flutter/material.dart';

class HelplineNumbers extends StatelessWidget {
  const HelplineNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'Helpline Numbers',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black87,
            fontFamily: "Satisfy",
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 100),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('Images/Cover5.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Text(
              'Emergency helpline numbers: ',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey[700],
                fontFamily: "Satisfy",
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            myWidget(),
          ],
        ),
      ),
    );
  }
}

Widget myWidget() {
  return Container(
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    decoration: myBoxDecoration(),
    child: Table(children: [
      TableRow(children: [
        Text(
          "DEPARTMENT",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[700],
            fontFamily: "Satisfy",
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          "NUMBER",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[700],
            fontFamily: "Satisfy",
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ]),
      const TableRow(children: [
        Text("PCR"),
        Text("100"),
        SizedBox(
          height: 20.0,
        ),
      ]),
      const TableRow(children: [
        Text("ERSS"),
        Text("112"),
        SizedBox(
          height: 20.0,
        ),
      ]),
      const TableRow(children: [
        Text("Traffic"),
        Text("1095"),
        SizedBox(
          height: 20.0,
        ),
      ]),
    ]),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 5.0,
    ),
  );
}
