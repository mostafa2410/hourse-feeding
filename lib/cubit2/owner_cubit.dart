import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit2/owner_state.dart';
import 'package:project/model/alekaamodel.dart';
import 'package:project/model/horsemodel.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/screen/productss.dart';

class OwnerCubit extends Cubit<OwnerState> {
  OwnerCubit() : super(OwnerInitialState());

  static OwnerCubit get(context) => BlocProvider.of(context);
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ));
  String? valueChoose;
  List<String> colorItems = ['Black', 'White'];
  List<String> gender_items = [
    'ذكر',
    'انثي',
  ];
  String? rasanValueChoose;

  void onChangeRasanDropDownButton(newValue) {
    rasanValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? ganderValueChoose;

  void onChangeGanderItem(newValue) {
    ganderValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? HorseNameChoose;

  void onChangeNameItem(newValue) {
    HorseNameChoose = newValue;
    emit(DropDownButtonState());
  }

  String? HorseHalaChoose;

  void onChangeHalaItem(newValue) {
    HorseHalaChoose = newValue;
    emit(DropDownButtonState());
  }

  String? colorValueChoose;

  void onChangeColorItem(newValue) {
    colorValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? AliqaValueChoose;

  void onChangeAliqaItem(newValue) {
    AliqaValueChoose = newValue;
    emit(DropDownButtonState());
  }
  String? AliqaValueChoose1;
  String? AliqaValueChoose2;
  String? AliqaValueChoose3;
  void onChangeAliqaIngredientItem(newValue,indeex) {
    if(indeex==0){
      AliqaValueChoose1=newValue;
    }
    else if(indeex==1){
      AliqaValueChoose2=newValue;
    }
    else if(indeex==2){
      AliqaValueChoose3=newValue;
    }
    emit(DropDownButtonState());
  }
  int index = 0;

  String? valueChooseType;

  void dropDownButtonType(newValue) {
    valueChooseType = newValue.toString();
    emit(DropDownButtonState());
  }
  
  Future<void> saveProduct(ProductData productData)async{
   await FirebaseFirestore.instance.collection('Ingredients').doc().set(productData.toMap()).then((value){
      emit(SendProductSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SendProductErrorState(error.toString()));

    });
  }
  Stream<List<ProductData>>? getProducts(){
    return FirebaseFirestore.instance.collection('Ingredients').snapshots().map((snapShot){
      return snapShot.docs.map((docs){
        return ProductData.fromJson(docs.data());
      }).toList();
    });
  }
  Future<void> saveala2kData(AlekaModel alekaModel)async{
   await FirebaseFirestore.instance.collection('ala2k').doc().set(alekaModel.toMap()).then((value){
      emit(SendProductSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SendProductErrorState(error.toString()));

    });
  }
  Stream<List<AlekaModel>>? getelAlaaik(){
    return FirebaseFirestore.instance.collection('ala2k').snapshots().map((snapShot){
      return snapShot.docs.map((docs){
        return AlekaModel.fromJson(docs.data());
      }).toList();
    });
  }


  Future<void> saveHorseFeed(HorseData horseData)async{
   await FirebaseFirestore.instance.collection('HorseFeeding').doc().set(horseData.toMap()).then((value){
      emit(SendHorseFeedSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SendHorseFeedErrorState(error.toString()));

    });
  }
   
  String? datanamechoose;
  void onChangedataItem(newValue) {
    datanamechoose = newValue;
    emit(DropDownButtonState());
  } 
  
}
