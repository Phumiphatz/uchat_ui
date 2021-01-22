import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/regisComp.dart';

class regisOtp extends StatefulWidget {
  @override
  _regisOtpState createState() => _regisOtpState();
}

class _regisOtpState extends State<regisOtp> {
  final _text = TextEditingController();
  String errtext;

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
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _text,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter the Value',
                  errorText: (errtext),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(
                    () {
                      if (_text.text.isEmpty) {
                        errtext = 'Value is not empty';
                      } else if (_text.text.length > 0 &&
                          _text.text.length < 6) {
                        errtext = 'Otp must be 6 digit';
                      } else if (_text.text == "999999") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => regisComp()),
                        );
                      } else {
                        errtext = 'OTP is 999999';
                      }
                      ;
                    },
                  );
                },
                child: Text('Submit'),
                textColor: Colors.white,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
