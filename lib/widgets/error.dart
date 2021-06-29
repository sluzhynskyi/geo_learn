import 'package:flutter/material.dart';



class ShowError extends StatelessWidget {
final String _message;

ShowError(String message):_message=message;

Widget build(context) {
  return Builder(builder: (context) {
            // print(loginError);
            if (_message != "") {
              return Container(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.all(Radius.circular(20)),
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
