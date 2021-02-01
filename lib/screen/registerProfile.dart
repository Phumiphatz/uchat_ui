import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uchat/widget/widget.dart';
import 'package:uchat/screen/registerComplete.dart';
import 'package:http/http.dart' as http;

class RegisterProfile extends StatefulWidget {
  String tokenOtp;
  String typeOtp;
  String otp;
  RegisterProfile(String tokenOtp, String typeOtp, String otp) {
    this.tokenOtp = tokenOtp;
    this.typeOtp = typeOtp;
    this.otp = otp;
  }

  @override
  RegisterProfileState createState() => RegisterProfileState();
}

class RegisterProfileState extends State<RegisterProfile> {
  final userName = TextEditingController();
  final displayName = TextEditingController();

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

  void sendToApi() async {
    var url = 'https://api.staging.uchat.zimpligital.com/api/auth/otp/process';
    var response = await http.post(url, body: {
      'username': userName.text,
      'displayName': displayName.text,
      'token': widget.tokenOtp,
      'otp': widget.otp
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisComp()),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: displayName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Displayname',
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Complete'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FloatingActionButton(
                  onPressed: () => {
                    setState(
                      () {
                        sendToApi();
                      },
                    )
                  },
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
