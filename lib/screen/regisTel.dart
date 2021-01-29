import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/regisOtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisTel extends StatefulWidget {
  @override
  _RegisTelState createState() => _RegisTelState();
}

class _RegisTelState extends State<RegisTel> {
  final phoneNumber = TextEditingController();
  final countryCode = 'TH';
  String errtext;
  String phoneCutFirstDigit;
  String tokenOtp;

  void checkRegisterTelephone() async {
    if (phoneNumber.text.isEmpty) {
      errtext = 'Value is not empty';
    } else if (phoneNumber.text.length > 0 && phoneNumber.text.length < 10) {
      errtext = 'Phone Number must be 10 digit';
    } else {
      if (phoneNumber.text.startsWith('0')) {
        phoneCutFirstDigit = '+66' + phoneNumber.text.substring(1);
        var url =
            'https://api.staging.uchat.zimpligital.com/api/auth/otp/request';
        ;

        // Await the http get response, then decode the json-formatted response.
        var response = await http.post(url, body: {
          'phoneNumber': phoneCutFirstDigit,
          'countryCode': countryCode
        });
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          var token = jsonResponse['token'];
          print('token: $token');
          tokenOtp = token;
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
        //
        // var url =
        //     'https://api.staging.uchat.zimpligital.com/api/auth/otp/request';
        // var response = await http.post(url, body: {
        //   'phoneNumber': phoneCutFirstDigit,
        //   'countryCode': countryCode
        // });

        // print('Response status: ${response.statusCode}');
        // print('Response body: ${response.body}');
        // print('Phone : $phoneCutFirstDigit');
        // print('token : $tokenOtp');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Otp(tokenOtp)),
        );
      } else {
        errtext = 'Phone number start by 0';
      }
    }
  }

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
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.width * 0.80,
                      child: Image.asset('assets/startlogin.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: phoneNumber,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          errorText: (errtext),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(
                          () {
                            checkRegisterTelephone();
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
            ],
          ),
        ),
      ),
    );
  }
}
