import 'package:flutter/material.dart';

Widget defaultbutton({required double width,required Color background,required Function function,required String text, double radius = 20.0,required double size})=>
    Container(
  width: width,
  child: MaterialButton(
    onPressed:function(),
    child: Text(text.toUpperCase(),style: TextStyle(fontSize: size,fontWeight: FontWeight.bold,color: Colors.white,),),),
  decoration: BoxDecoration(
    borderRadius:BorderRadius.circular(radius),
    color: background,
  ),
);

Widget defaultFormField({
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  var prefixIconTapFunction,
  required var validator,
  required String label,
  required IconData prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
  TextEditingController? controller
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: TextStyle(
          color: Colors.black
      ),
      decoration: InputDecoration(
          labelText: label,

          prefixIcon: InkWell(
            onTap: prefixIconTapFunction,
            child: Icon(
              prefixIcon,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: sufixPressed,
              icon: Icon(
                suffixIcon,
              ))
              : null,

          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.brown,

              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.brown,

              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.white,

              )
          )
      ),
    );


Widget BuildDropBottom(
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
