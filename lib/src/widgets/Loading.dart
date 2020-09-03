


import 'package:flutter/material.dart';


class Loading extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   return Container();
  }


   Future<bool> loading(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content:    SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
}


}