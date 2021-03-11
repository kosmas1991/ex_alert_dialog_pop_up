import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  Future<String> createAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Whaat\'s your name?'),
        content: TextField(
          controller: customController,
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop(customController.text.toString());
          }, child: Text('Submit',style: TextStyle(fontSize: 20),))
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog example'),
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Center(
          child: Material(
            color: Colors.grey.shade300,
            elevation: 40,
            child: TextButton(
              onPressed: () {
                createAlertDialog(context).then((value) {
                  SnackBar mySnackBar = SnackBar(content: Text('hello $value'));
                  ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                });
              },
              child: Text('Press me', style: TextStyle(fontSize: 35),),
            ),
          ),
        ),
      ),
    );
  }
}
