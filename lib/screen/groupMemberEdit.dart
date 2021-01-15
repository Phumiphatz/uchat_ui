import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/widget/widget.dart';

class groupMemEdit extends StatefulWidget {
  @override
  _groupMemEditState createState() => _groupMemEditState();
}

class _groupMemEditState extends State<groupMemEdit>
    with TickerProviderStateMixin {
  AnimationController animationController;
  TextEditingController editingController = TextEditingController();
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
            child: Text('Edit', style: appBarTextStyle()),
            textColor: Colors.black,
            onPressed: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
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
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                width: tween.value / 2,
                                height: 500,
                                color: Colors.pink[400],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 15),
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


  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
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

  Widget buildSizeTransitionWidget(
      {AnimationController controller, Widget widget}) {
    return AnimatedBuilder(
        animation: controller,
        child: widget,
        builder: (context, child) {
          return SizeTransition(
              axis: Axis.horizontal,
              axisAlignment: 1,
              sizeFactor: Tween<double>(begin: 0, end: 1).animate(controller),
              child: child);
        });
  }
}
