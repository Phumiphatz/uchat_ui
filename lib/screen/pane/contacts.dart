import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/screen/groupMember.dart';
import 'package:uchat/screen/regisTel.dart';

class ContactsPane extends StatefulWidget {
  @override
  _ContactsPaneState createState() => _ContactsPaneState();
}

class _ContactsPaneState extends State<ContactsPane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ElevatedButton(
                child: Text('GroupMember'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => groupMember()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Regis'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => regisTel()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          '',
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

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
