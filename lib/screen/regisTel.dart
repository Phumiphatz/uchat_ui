import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/regisOtp.dart';

class regisTel extends StatefulWidget {
  @override
  _regisTelState createState() => _regisTelState();
}

class _regisTelState extends State<regisTel> {
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
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'phone',
                ),
              ),
              ElevatedButton(
                child: Text('next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => regisOtp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
