import 'package:flutter/material.dart';
import 'package:project/screen/alka.dart';
import 'package:project/screen/carehorse.dart';
import 'package:project/screen/productss.dart';
import 'package:project/screen/show.dart';
import 'package:project/shared/component/component.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         InkWell(
           onTap: (){
             showDialog(
                 context: context,
                 builder: (_) =>Padding(
                   padding: const EdgeInsets.only(
                     right: 50,
                     left: 50,
                   ),
                   child: AlertDialog(
                   shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0),
                 ),
                  actions: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Product()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            width: double.infinity,
                            height: 100.0,
                            child: defaultbutton(
                                width:double.infinity,
                                background: Colors.grey.withOpacity(0.9),
                                function:(){},
                                text:'مكونات العلائق',
                                size: 20.0
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetails()));
                           },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                            width: double.infinity,
                            height: 100.0,
                            child: defaultbutton(


                                width:double.infinity,
                                background: Colors.grey.withOpacity(0.9),
                                function:(){print("hello flutter");},
                                text:'العلائق',
                                size: 20.0
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AlCar()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                            width: double.infinity,
                            height: 100.0,
                            child: defaultbutton(
                                width:double.infinity,
                                function:(){print("hello flutter");},
                                background: Colors.grey.withOpacity(0.9),
                                text:'كون عليقة',
                                size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
               ),
                 ),
             );
           },
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
             width: double.infinity,
             height: 100.0,
             child: defaultbutton(
               width:double.infinity,
               background:Colors.grey,
               function:(){print("hello flutter");},
               text:'تكوين العلائق',
               size: 30.0
             ),
           ),
         ),
         SizedBox(height: 30,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>CareHorse()));
           },
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
             width: double.infinity,
             height: 100.0,
             child: defaultbutton(
               width:double.infinity,
               background:Colors.grey,
               function:(){print("hello flutter");},
               text:'الخيول والتغذية',
               size: 30.0
             ),
           ),
         ),
       ],
     ),
    );
  }
}
