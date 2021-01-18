import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      height: 40,
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

TextStyle memTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

TextStyle appBarTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
}

class LoopMember extends StatelessWidget {
  var pic;
  var textName;

  LoopMember(this.pic, this.textName) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage(pic),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(textName, style: memTextStyle()),
          )
        ],
      ),
    );
  }
}
