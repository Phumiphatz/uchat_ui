import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/screen/groupMemberEdit.dart';
import 'package:uchat/widget/widget.dart';

class GroupMember extends StatefulWidget {
  @override
  _GroupMemberState createState() => _GroupMemberState();
}

class _GroupMemberState extends State<GroupMember> {
  TextEditingController editingController = TextEditingController();

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
      title: Text('Member', style: appBarTextStyle()),
      actions: <Widget>[
        FlatButton(
          child: Text('Edit', style: appBarTextStyle()),
          textColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroupMemberEdit()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                      child: Text('Member', style: memTextStyle()),
                    ),
                    Wrap(
                      spacing: 15,
                      runSpacing: 20,
                      direction: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("tapped add");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/add.png'),
                                radius: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text('add', style: memTextStyle()),
                            )
                          ],
                        ),
                        LoopMember('assets/babytom.png', 'tom'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                        LoopMember('assets/jerry.png', 'jerry'),
                      ],
                    ),
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
