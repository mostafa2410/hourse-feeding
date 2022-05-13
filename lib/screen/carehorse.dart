import 'package:flutter/material.dart';
import 'package:project/screen/horsedetails.dart';
import 'package:project/shared/component/component.dart';
class CareHorse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("قسم الرعاية : التغذية",style: TextStyle(fontSize: 30.0),)),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  width: double.infinity,
                  height: 60.0,
                  child: defaultbutton(
                    width:double.infinity,
                    background:Colors.grey,
                    function:(){print("hello flutter");},
                    text:'التذكر',
                    size: 20.0
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScren()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    width: double.infinity,
                    height: 60.0,
                    child: defaultbutton(
                      width:double.infinity,
                      background:Colors.grey,
                      function:(){print("hello flutter");},
                      text:'الخيول والتغذية',
                      size: 20.0
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
