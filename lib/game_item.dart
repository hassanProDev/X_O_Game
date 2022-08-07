import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  String? text;
  Function? func;
  int? index;

  GameItem({Key? key, this.text, this.func, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          func!(index);
          print(index);
        },
        child: Text(
          '$text',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
