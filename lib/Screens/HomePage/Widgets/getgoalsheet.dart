import 'package:flutter/material.dart';
import 'package:stepometer/DataBase/db_goalcount/goal_model.dart';
import 'package:stepometer/Screens/HomePage/dashboard.dart';
import 'package:stepometer/Screens/HomePage/homescreen.dart';
import 'package:flutter/services.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../../Constants/texts.dart';
import '../../../DataBase/database.dart';

class GetGoalSheet extends StatefulWidget {
  late GoalModel? model = GoalModel();

  GetGoalSheet({Key? key}) : super(key: key);

  @override
  State<GetGoalSheet> createState() => _GetGoalSheetState();
}

class _GetGoalSheetState extends State<GetGoalSheet> {
  MyDatabase db = MyDatabase();
  bool isGetStep = true;
  TextEditingController stepController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // stepController = TextEditingController(
    //     text: widget.model != null ? widget.model!.GoalCount.toString() : '');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: _formKey,
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
              child: TextFormField(
                controller: stepController,
                validator: (value) {
                  if (value == null || value!.trim() == '0' ||  value!.trim() == '') {
                    return 'Enter More Steps ';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
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
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        Navigator.of(context).pop(true);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return HomePage();
                        },));
                        db.updateGoalStep(
                            goalCount: stepController.text.toString(), goalID: 1);
                      });
                    }
                  });
                },
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
      ),
    );
  }
}
