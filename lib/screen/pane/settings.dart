import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPane extends StatefulWidget {
  @override
  _SettingsPaneState createState() => _SettingsPaneState();
}

class _SettingsPaneState extends State<SettingsPane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    child: GestureDetector(
                      onTap: () {
                        print("tapped bg");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/bg.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 200,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("tapped pic");
                                },
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/babytom.png'),
                                  radius: 60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Color(0xffffffff)),
                    child: new Material(
                      child: new InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog();
                            },
                          );
                          print("tapped 1");
                        },
                        child: Column(
                          children: <Widget>[
                            new Container(
                              width: double.infinity,
                              height: 80,
                              padding: const EdgeInsets.only(
                                left: 40,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: new Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: Text(
                                          'Display name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Color(0xffffffff)),
                    child: new Material(
                      child: new InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog();
                              });
                          print("tapped 2");
                        },
                        child: Column(
                          children: <Widget>[
                            new Container(
                              width: double.infinity,
                              height: 80,
                              padding: const EdgeInsets.only(
                                left: 40,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: new Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: Text(
                                          'Status',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Color(0xffffffff)),
                    child: new Material(
                      child: new InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog();
                              });
                          ;
                        },
                        child: Column(
                          children: <Widget>[
                            new Container(
                              width: double.infinity,
                              height: 80,
                              padding: const EdgeInsets.only(
                                left: 40,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: new Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: Text(
                                          'Phone',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(Icons.keyboard_arrow_right),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Color(0xffffffff)),
                    child: Column(children: <Widget>[
                      new Container(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: new Padding(
                                  padding:
                                      const EdgeInsets.only(top: 7, right: 15),
                                  child: Text(
                                    'Domino',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Divider(height: 1, color: Colors.grey.shade600),
                  SizedBox(height: 40.0),
                  Divider(height: 1, color: Colors.grey.shade600),
                  Container(
                    decoration: new BoxDecoration(color: Color(0xffffffff)),
                    child: new Material(
                      child: new InkWell(
                        onTap: () {
                          print("tapped qr");
                        },
                        child: Column(
                          children: <Widget>[
                            new Container(
                              width: double.infinity,
                              height: 40,
                              padding: const EdgeInsets.only(
                                left: 40,
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: new Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Text(
                                              'My QR CODE',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey.shade600),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFFFFF),
    );
  }
}

class CustomDialog extends StatelessWidget {
  dialogContent(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image.asset(
          //   'assets/bg.jpg',
          //   fit: BoxFit.cover,
          //   height: 300,
          //   width: double.infinity,
          // ),
          // SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Text 1",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () =>
                    {Navigator.of(context, rootNavigator: true).pop('dialog')},
                textColor: Colors.blue,
                child: Text(
                  'Save',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
