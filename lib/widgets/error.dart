import 'package:flutter/material.dart';



class ShowError extends StatelessWidget {
final String _message;

ShowError(String message):_message=message;

Widget build(context) {
  return Builder(builder: (context) {
            // print(loginError);
            if (_message != "") {
              return Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  width: double.infinity,
                  child: Text(
                    _message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ));
            }
            return Container();
          });
  }
}
