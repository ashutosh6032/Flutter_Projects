import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BecomeSafeguide extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BecomeSafeguide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'Become a Safeguide',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black87,
            fontFamily: "Satisfy",
          ),
        )),
      ),
      backgroundColor: Colors.lightBlueAccent[200],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('Images/Cover.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 100),
        child: Form(
          key: _formKey,
          // autovalidate: true,
          child: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                const Center(
                  child: Text(
                    'Enter User Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Enter a email address',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    hintText: 'Enter area',
                    labelText: 'Location',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    // splashColor: Colors.grey,
                    // color: Colors.lightGreenAccent,
                    onPressed: () {
                      _displaySnackBar(context);
                    },
                    // elevation: 20.0,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0),
                    // ),
                    // highlightElevation: 20.0,
                    // highlightColor: Colors.white,
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    const snackBar = SnackBar(content: Text('Details Saved Succesfully.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
