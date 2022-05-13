import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/state.dart';
class AppCubit extends Cubit<AppState>{
  AppCubit():super(AppIntialState());
  static AppCubit get(context) =>BlocProvider.of(context);

  List<dynamic>countries=[];
  String? counterid;
  List<dynamic> types = [];
  String? typeid;
  List<dynamic> hoies = [];
  String? horid;
  @override
  void initState() {
    initState();
    this.countries.add({"id": 1, "label": "حصان1 "});
    this.countries.add({"id": 2, "label": "حصان2"});
    this.countries.add({"id": 3, "label": "حصان3"});
    this.types.add({"id": 1, "label": "بالغ"});
    this.types.add({"id": 2, "label": "مفطوم"});
    this.types.add({"id": 3, "label": "حامل"});
    this.types.add({"id": 4, "label": "بعد الولادة"});
    this.types.add({"id": 5, "label": "قبل الولادة"});
    this.types.add({"id": 6, "label": "طلوق"});
    this.hoies.add({"id": 1, "label": "عليقة 1"});
    this.hoies.add({"id": 2, "label": "عليقة 2"});
    this.hoies.add({"id": 3, "label": "عليقة 3"});
    onchange(val){
      this.counterid=val;
    }
  }

   BuildDropBottom(
      {required dropdownButtonTitle,
        required value,
        required function,
        required items}) =>
      Center(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0)),
          child: DropdownButton(
//elevation: 0,
              hint: Text(
                dropdownButtonTitle,
                style: TextStyle(
                  fontSize: 18.0,
//fontWeight: FontWeight.bold,
                ),
              ),
              dropdownColor: Colors.white54.withOpacity(0.6),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
//textDirection: TextDirection.rtl, عايز اعمل ده
              ),
              value: value,
              onChanged: function,
              items: items),
        ),
      );

}








class AppCubit2 extends Cubit<AppState>{
  static AppCubit2 get(context) =>BlocProvider.of(context);
  AppCubit2():super(intialstate());
  late PageController pageController;
  void _onscroll(){

  }
  @override
  void initState() {
    pageController=PageController(
      initialPage: 0,
    )..addListener(_onscroll);
    emit(intialstate());
  }
}
class AppCubit3 extends Cubit<AppState>{
  AppCubit3():super(AppChange2Statebottom());
  static AppCubit3 get(context) =>BlocProvider.of(context);

  int index1=0;
  void  change2index(int indexx2){
    index1=indexx2;
    emit(AppChange2Statebottom());
  }
}