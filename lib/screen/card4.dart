import 'package:flutter/material.dart';
import 'package:project/model/caremodel.dart';
class Card4 extends StatelessWidget {
  const Card4({
    Key? key,
    required this.caar,
  }) : super(key: key);
  final CarModl caar;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: 100.0,
      child: InkWell(
        onTap: (){
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>PathHorse()));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                color: Colors.grey

              ),
            ),
            Positioned(
              left: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,bottom: 30.0),
                child: Container(
                child:Text(caar.price),
            ),
              ),

                ),
            Positioned(

                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28.0,left: 150),
                  child: Text(caar.Titlle,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),textDirection: TextDirection.rtl,),
                ),

            ),
          ],
        ),
      ),

    );
  }
}