import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';

class GroupMemberEdit extends StatefulWidget {
  @override
  _GroupMemberEditState createState() => _GroupMemberEditState();
}

class _GroupMemberEditState extends State<GroupMemberEdit>
    with TickerProviderStateMixin {
  AnimationController animationController;
  bool _visible = false;
  bool textedit = false;
  bool coloredit = false;
  bool iconchange = true;
  bool checkIcon = false;

  void toggleCheck() {
    iconchange = !iconchange;
  }

  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 1000));
    animationController.addListener(() {
      setState(() {
        print(animationController.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tween = Tween<double>(begin: 0, end: 100).animate(animationController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Member', style: appBarTextStyle()),
        actions: <Widget>[
          FlatButton(
            child: Text(textedit ? 'Remove' : 'Edit',
                style: TextStyle(
                  color: coloredit ? Colors.red : Colors.black,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                )),
            onPressed: () {
              if (animationController.isCompleted) {
                animationController.reverse();
                setState(() {
                  _visible = false;
                  coloredit = false;
                  textedit = false;
                });
              } else {
                animationController.forward();
                setState(() {
                  _visible = true;
                  coloredit = true;
                  textedit = true;
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: editingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text('Member', style: memTextStyle()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                width: tween.value / 2,
                                height: 550,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Container(
                                      child: AnimatedOpacity(
                                        opacity: _visible ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 1000),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 35),
                                          child: GestureDetector(
                                            onTap: () {
                                              print("tapped circle");
                                              setState(() {
                                                toggleCheck();
                                              });
                                            },
                                            child: Icon(
                                              iconchange
                                                  ? Icons.circle
                                                  : Icons.check_circle_outline,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      backgroundImage:
                                          AssetImage('assets/babytom.png'),
                                      radius: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Text('tommy', style: memTextStyle()),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
