import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit2/owner_cubit.dart';
import 'package:project/cubit2/owner_state.dart';
import 'package:project/model/caremodel.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/screen/card4.dart';
import 'package:project/shared/component/component.dart';
class Product extends StatelessWidget {
              
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>OwnerCubit(),
      child: BlocConsumer<OwnerCubit,OwnerState>(builder: (context,state){
        
        return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return addDialog(context: context);
              }
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
      body:  StreamBuilder(
        stream: OwnerCubit.get(context).getProducts(),
        builder: (context, snapshot) {

        if(snapshot.hasData){
          List<ProductData> products=snapshot.data as List<ProductData>;
          return  Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView.separated(itemBuilder: ((context, index) => productItem(
          context: context,
           data: products[index])),
         separatorBuilder: (context,index)=>SizedBox(height: 20,),
          itemCount: products.length)
      );
        }
        else{
          return Text('error');
        }
      },)
    );
      }, listener: (context,state){}),
    );
  }
  Widget productItem({
    required context,
    required ProductData data
  })=>InkWell(
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
                        Center(
                          child: Column(
                            children: [
                              Text( "${data.productName}",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productPrice} جنيه",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productPower}% طاقة ",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productProtein}% بروتين",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productMetal}% حديد",style: TextStyle(color: Colors.black,fontSize: 22.0),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                width: double.infinity,
                height: 100.0,

                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text("سعر الكيلو: ${data.productPrice} جنيه",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0),textDirection: TextDirection.ltr,),
                    )),
                    Padding(padding:  const EdgeInsets.only(right: 40.0),child: Text("${data.productName}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),textDirection: TextDirection.rtl,),
                  )
                    ],
                ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: Colors.grey,
                  )
              ),
            );
  AlertDialog addDialog({required context}){
      TextEditingController? nameController=TextEditingController();
    TextEditingController? priceController=TextEditingController();
    TextEditingController? metalController=TextEditingController();
    TextEditingController? powerController=TextEditingController();
    TextEditingController? proteinController=TextEditingController();
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Center(
                  child: Text(
                    'المكونات',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                content:SingleChildScrollView(
                  child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'اسم المكون',
                        prefixIcon: Icons.production_quantity_limits_sharp),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: priceController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'سعر الكيلو',
                        prefixIcon: Icons.price_change),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: powerController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'الطاقة',
                        prefixIcon: Icons.power_input),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: proteinController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: ' البروتين ',
                        prefixIcon: Icons.create_new_folder_outlined),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: metalController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: ' الحديد ',
                        prefixIcon: Icons.medical_services),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  
                ]),
                ),
                actions: [
                  BlocProvider(create: (context) =>OwnerCubit() ,
                  child: BlocConsumer<OwnerCubit,OwnerState>(
                    listener: (context, state) {
                      
                    },
                    builder: (context,state){
                      return Form(
                    key: formKey,
                    child:Container(
                      width: double.infinity,
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                       
                      ),
                    child:Text( 'حفظ '),
                    onPressed: () {  
                       OwnerCubit.get(context).saveProduct(
                        ProductData(
                          nameController.text.toString(),
                        priceController.text.toString(), 
                        metalController.text.toString(),
                        powerController.text.toString(),
                        proteinController.text.toString() 
                        )
                      ).then((value){
                      Navigator.pop(context);
                      });
                    
                    },
                    
                  ),
                    )
                    );
                
                    },
                  ),)
                ],
                backgroundColor: Colors.white,
          );
  }
  }
