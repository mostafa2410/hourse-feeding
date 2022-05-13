import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
class DropHome extends StatefulWidget {
  @override
  _DropHomeState createState() => _DropHomeState();
}
class _DropHomeState extends State<DropHome> {
  List<dynamic>countries=[];
  String? counterid;
  @override
  void initState() {
    super.initState();
    this.countries.add({"id":1,"label":"india"});
    this.countries.add({"id":2,"label":"UAE"});
    this.countries.add({"id":3,"label":"UAE"});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           FormHelper.dropDownWidget(
             context,
             "select item",
             this.counterid,
             this.countries,
                 (onChangevalu){
             this.counterid=onChangevalu;
             print("selected country: $onChangevalu");

           },
          (onValidate){
             if(onValidate==null){
               return 'please select country';
             }
             return null;
          },
             borderColor: Theme.of(context).primaryColor,
             borderFocusColor: Theme.of(context).primaryColor,
             borderRadius: 10,
             optionValue: "id",
             optionLabel: "label",
           )
          ],
        ),
      ),
    );
  }
}
