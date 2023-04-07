import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../../Constants/texts.dart';

class GetGoalSheet extends StatelessWidget {
  const GetGoalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: ImageIcon(
              AssetImage(walkgif),
              color: Colors.black,
              size: 75,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 23, bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Set Your Goal.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 23, left: 23, bottom: 20),
            child: const TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Steps',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 23, bottom: 15),
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: const Color.fromARGB(255, 34, 77, 59),
                elevation: 0,
                shape: StadiumBorder(),
                minimumSize: const Size(150, 40),
              ),
              child: Text(
                "SET",
                style: const TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: obcolor2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
