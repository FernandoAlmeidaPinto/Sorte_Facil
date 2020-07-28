import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Numbers extends StatelessWidget {
  final String number;
  final bool active;
  final void Function(String) cb;
  

  Numbers({
    @required this.number,
    @required this.active,
    this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: RaisedButton(
        color: this.active ? Colors.purple : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        child: Text(
          this.number,
          style: TextStyle(
            color: this.active ? Colors.white : Colors.purple,
            fontSize: 10
          ),
        ),
        onPressed: () {
          cb((this.number));
          Vibration.vibrate(duration: 35);
        },
      ),
    );
  }
}
