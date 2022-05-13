import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
class DropScreen extends StatefulWidget {
  @override
  _DropScreenState createState() => _DropScreenState();
}

class _DropScreenState extends State<DropScreen> {
  List<dynamic>countries=[];
  String? counterid;
  @override
  void initState() {
    super.initState();
    this.countries.add({"id":1,"label":"india"});
    this.countries.add({"id":2,"label":"UAE"});
    this.countries.add({"id":3,"label":"BBB"});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }

  Widget buildDropDownWidget(BuildContext context) {
    return FormHelper.dropDownWidget(
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
    );
  }
}
