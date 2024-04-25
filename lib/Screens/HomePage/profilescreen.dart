import 'package:flutter/material.dart';
import 'package:stepometer/Constants/colors.dart';

import '../../Constants/images.dart';
import '../../Constants/texts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profilekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: maintheme.shade200,
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        margin: EdgeInsets.all(25),
                        child: CircleAvatar(
                          foregroundColor: mainthemecolor,
                          foregroundImage: AssetImage(profileimg),
                          radius: 60,
                          //backgroundImage: AssetImage(profileimg),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: mainthemecolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Rydham1308',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                        ),
                        Container(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              foregroundColor: Color.fromARGB(255, 34, 77, 59),
                              shadowColor: Colors.transparent,
                              elevation: 00,
                              //minimumSize: const Size(250, 50),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 34, 77, 59),
                                width: 4,
                              ),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: Color.fromARGB(255, 34, 77, 59),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Card(
            //   margin: EdgeInsets.all(15),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Column(
            //             children: [
            //               TextFormField(
            //                 //obscureText: true,
            //                 style: TextStyle(color: Colors.black),
            //                 decoration: InputDecoration(
            //                   labelText: 'Password',
            //                   labelStyle: TextStyle(
            //                     color: Colors.white54,
            //                   ),
            //                   focusedBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   enabledBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   border: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                 ),
            //               ),
            //               TextFormField(
            //                 //obscureText: true,
            //                 style: TextStyle(color: Colors.black),
            //                 decoration: InputDecoration(
            //                   labelText: 'Password',
            //                   labelStyle: TextStyle(
            //                     color: Colors.white54,
            //                   ),
            //                   focusedBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   enabledBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   border: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               TextFormField(
            //                 //obscureText: true,
            //                 style: TextStyle(color: Colors.black),
            //                 decoration: InputDecoration(
            //                   labelText: 'Password',
            //                   labelStyle: TextStyle(
            //                     color: Colors.white54,
            //                   ),
            //                   focusedBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   enabledBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   border: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                 ),
            //               ),
            //               TextFormField(
            //                 //obscureText: true,
            //                 style: TextStyle(color: Colors.black),
            //                 decoration: InputDecoration(
            //                   labelText: 'Password',
            //                   labelStyle: TextStyle(
            //                     color: Colors.white54,
            //                   ),
            //                   focusedBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   enabledBorder: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                   border: UnderlineInputBorder(
            //                     borderSide: BorderSide(color: Colors.black),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
