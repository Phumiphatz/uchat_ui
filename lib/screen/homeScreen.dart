import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pane/settings.dart';

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    this._pageController = PageController();
  }

  @override
  void dispose() {
    this._pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            Text(
              'Index 0: Home',
            ),
            Text(
              'Index 1: Business',
            ),
            SettingsPane(),
          ],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: 25,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: this.buildChatBadge(
                context,
                Icon(
                  Icons.message,
                  size: 20,
                )),
            icon: this.buildChatBadge(
                context,
                Icon(
                  Icons.message_outlined,
                  size: 20,
                )),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            activeIcon: this.buildChatBadge(
                context,
                Icon(
                  Icons.settings,
                  size: 25,
                )),
            icon: this.buildChatBadge(
                context,
                Icon(
                  Icons.settings_outlined,
                  size: 25,
                )),
            label: 'Settings',
          ),
        ],
        activeColor: Color(0xFF0056fd),
        inactiveColor: Color(0xff8F8F8F),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildChatBadge(BuildContext context, Widget icon) {
    return Badge(
        badgeContent:
            Text('3', style: TextStyle(color: Colors.white, fontSize: 8)),
        toAnimate: false,
        padding: EdgeInsets.all(4.0),
        position: BadgePosition.topEnd(top: 2),
        child: icon);
  }
}
