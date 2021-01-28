import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/regisComp.dart';

class RegisProfile extends StatefulWidget {
  @override
  _RegisProfileState createState() => _RegisProfileState();
}

class _RegisProfileState extends State<RegisProfile> {
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FloatingActionButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisComp()),
                    )
                  },
                  child: Icon(Icons.home),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
