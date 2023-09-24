import 'package:flutter/cupertino.dart';
import '../utilis/colors.dart';

Widget Custom_Text(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: ColorsCode.skip_welcomepagetext_prodetails,
        fontFamily: "Roboto"),
  );
}

Widget Catagory_Text(String text){
  return Text(
    text,
    style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: ColorsCode.skip_welcomepagetext_prodetails,
        fontFamily: "Roboto"),
  );
}

Widget Catagory_Text_title(String text){
  return Text(
    text,
    style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsCode.dep_black,
        fontFamily: "Roboto"),
  );
}

Widget Catagory_Text_subtitle(String text){
  return Text(
    text,
    style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: ColorsCode.skip_welcomepagetext_prodetails,
        fontFamily: "Roboto"),
  );
}

Widget Product_Name(String text){
  return Text(
    text,
    style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsCode.skip_welcomepagetext_prodetails,
        fontFamily: "Roboto"),
  );
}


Widget Product_Price(String text){
  return Text(
    text,
    style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
        fontFamily: "Roboto"),
  );
}