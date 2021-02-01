import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uchat/screen/registerComplete.dart';
import 'package:uchat/screen/registerProfile.dart';
import 'package:uchat/widget/widget.dart';
import 'package:http/http.dart' as http;

class RegisterOtp extends StatefulWidget {
  String tokenOtp;
  String typeOtp;
  RegisterOtp(String tokenOtp, String typeOtp) {
    this.tokenOtp = tokenOtp;
    this.typeOtp = typeOtp;
  }

  @override
  RegisterOtpState createState() => new RegisterOtpState();
}

class RegisterOtpState extends State<RegisterOtp>
    with SingleTickerProviderStateMixin {
  // Variables
  Size screenSize;
  int currentDigit;
  int firstDigit;
  int secondDigit;
  int thirdDigit;
  int fourthDigit;
  int fifthDigit;
  int sixthDigit;
  String otp;
  String status;

  void clearOtp() {
    sixthDigit = null;
    fifthDigit = null;
    fourthDigit = null;
    thirdDigit = null;
    secondDigit = null;
    firstDigit = null;
    setState(() {});
  }

  void deleteDigitInOtpTextField() {
    if (sixthDigit != null) {
      sixthDigit = null;
    } else if (fifthDigit != null) {
      fifthDigit = null;
    } else if (fourthDigit != null) {
      fourthDigit = null;
    } else if (thirdDigit != null) {
      thirdDigit = null;
    } else if (secondDigit != null) {
      secondDigit = null;
    } else if (firstDigit != null) {
      firstDigit = null;
    }
  }

  void checkOtp() async {
    print('Otp : $otp');
    print('token : ${widget.tokenOtp}');
    print('token : ${widget.typeOtp}');
    var url = 'https://api.staging.uchat.zimpligital.com/api/auth/otp/verify';
    var response =
        await http.post(url, body: {'token': widget.tokenOtp, 'otp': otp});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    status = response.body;

    if (status == 'true' && widget.typeOtp == 'LOGIN') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisComp()),
      );
    } else if (status == 'true' && widget.typeOtp == 'REGISTER') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RegisterProfile(widget.tokenOtp, widget.typeOtp, otp)),
      );
    } else {
      clearOtp();
    }
  }

  // Returns "Appbar"
  get getAppbar {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new InkWell(
        borderRadius: BorderRadius.circular(30.0),
      ),
      centerTitle: true,
      title: Text('Registration', style: appBarTextStyle()),
    );
  }

  // Returns "OTP" input part
  get getInputPart {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        getVerificationCodeLabel,
        getInputField,
        getButton,
        getOtpKeyboard
      ],
    );
  }

  // Return "Verification Code" label
  get getVerificationCodeLabel {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: new Text(
        "Verification Code",
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Return "OTP" input field
  get getInputField {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        otpTextField(firstDigit),
        otpTextField(secondDigit),
        otpTextField(thirdDigit),
        otpTextField(fourthDigit),
        otpTextField(fifthDigit),
        otpTextField(sixthDigit),
      ],
    );
  }

  get getButton {
    return new RaisedButton(
      onPressed: () {
        checkOtp();
      },
      child: Text('Submit'),
      textColor: Colors.white,
      color: Colors.blueAccent,
    );
  }

  // Returns "Otp" keyboard
  get getOtpKeyboard {
    return new Container(
        height: screenSize.width - 80,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  otpKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  otpKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  otpKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  otpKeyboardInputButton(
                      label: "4",
                      onPressed: () {
                        _setCurrentDigit(4);
                      }),
                  otpKeyboardInputButton(
                      label: "5",
                      onPressed: () {
                        _setCurrentDigit(5);
                      }),
                  otpKeyboardInputButton(
                      label: "6",
                      onPressed: () {
                        _setCurrentDigit(6);
                      }),
                ],
              ),
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  otpKeyboardInputButton(
                      label: "7",
                      onPressed: () {
                        _setCurrentDigit(7);
                      }),
                  otpKeyboardInputButton(
                      label: "8",
                      onPressed: () {
                        _setCurrentDigit(8);
                      }),
                  otpKeyboardInputButton(
                      label: "9",
                      onPressed: () {
                        _setCurrentDigit(9);
                      }),
                ],
              ),
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    width: 80.0,
                  ),
                  otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  otpKeyboardActionButton(
                    label: new Icon(
                      Icons.backspace,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          deleteDigitInOtpTextField();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  // Returns "Otp custom text field"
  Widget otpTextField(int digit) {
    return new Container(
      width: 35.0,
      height: 45.0,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Returns "Otp keyboard input Button"
  Widget otpKeyboardInputButton({String label, VoidCallback onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns "Otp keyboard action Button"
  otpKeyboardActionButton({Widget label, VoidCallback onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }

  // Current digit
  void _setCurrentDigit(int i) {
    setState(() {
      currentDigit = i;
      if (firstDigit == null) {
        firstDigit = currentDigit;
      } else if (secondDigit == null) {
        secondDigit = currentDigit;
      } else if (thirdDigit == null) {
        thirdDigit = currentDigit;
      } else if (fourthDigit == null) {
        fourthDigit = currentDigit;
      } else if (fifthDigit == null) {
        fifthDigit = currentDigit;
      } else if (sixthDigit == null) {
        sixthDigit = currentDigit;
      }
      otp = firstDigit.toString() +
          secondDigit.toString() +
          thirdDigit.toString() +
          fourthDigit.toString() +
          fifthDigit.toString() +
          sixthDigit.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: getAppbar,
      backgroundColor: Colors.white,
      body: new Container(
        width: screenSize.width,
//        padding: new EdgeInsets.only(bottom: 16.0),
        child: getInputPart,
      ),
    );
  }
}
