import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/regisOtp.dart';

class regisTel extends StatefulWidget {
  @override
  _regisTelState createState() => _regisTelState();
}

class _regisTelState extends State<regisTel> {
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _text,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Tel',
                  errorText: (errtext),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(
                    () {
                      if (_text.text.isEmpty) {
                        errtext = 'Value is not empty';
                      }
                      if (_text.text.length > 0 && _text.text.length < 10) {
                        errtext = 'tel must be 10 digit';
                      }
                      if (_text.text == "0629999999") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => regisOtp()),
                        );
                      } else {
                        errtext = 'Tel is 0629999999';
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
