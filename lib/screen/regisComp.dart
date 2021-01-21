import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uchat/widget/widget.dart';

class regisComp extends StatefulWidget {
  @override
  _regisCompState createState() => _regisCompState();
}

class _regisCompState extends State<regisComp> {
  @override
  @override
  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('Registration', style: appBarTextStyle()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text('Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
