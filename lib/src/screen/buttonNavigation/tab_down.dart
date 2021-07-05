import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';
import 'package:flutteruinew/src/home/home_widget.dart';
import 'package:flutteruinew/src/screen/dashboard/dashboard.dart';
import 'package:flutteruinew/src/screen/profile/profile.dart';

// ignore: must_be_immutable
class TabsWidget extends StatefulWidget {
  int? currentTab = 2;
  int? selectTab = 2;
  String currentTitle = 'Home';
  Widget currentPage = HomeWidget();
  TabsWidget({
    Key? key,
    this.currentTab,
  }) : super(key: key);
  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.currentTitle,
        ),
        elevation: 0,
        actions: [
          Container(
            width: 30.0,
            height: 30.0,
            margin: EdgeInsets.only(
              top: 12.5,
              bottom: 12.5,
              right: 20.0,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                300.0,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/Tabs', arguments: 1);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'img/user2.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: widget.currentPage,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.tealAccent,
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              UiIcons.bell,
            ),
            label: "Dashbaord"),
        BottomNavigationBarItem(
          icon: Icon(
            UiIcons.user_1,
          ),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50.0,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.4),
                  blurRadius: 40.0,
                  offset: Offset(
                    0,
                    15,
                  ),
                ),
                BoxShadow(
                  color: Colors.teal.withOpacity(0.4),
                  blurRadius: 13.0,
                  offset: Offset(
                    0,
                    3,
                  ),
                ),
              ],
            ),
            child: Icon(
              UiIcons.home,
              color: Theme.of(context).primaryColor,
            ),
          ),
          label: "Home",
        ),
      ],
    );
  }

  _onTap(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
      switch (tabIndex) {
        case 0:
          widget.currentTitle = 'Home';
          widget.currentPage = HomeWidget();

          break;
        case 1:
          widget.currentTitle = "Profile";
          widget.currentPage = Profile();
          break;
        case 2:
          widget.currentTitle = "Apaaja";
          widget.currentPage = DashBoard();
          // _scaffoldKey.currentState!.pushReplacementNamed("Settings");
          break;
      }
    });
  }
}
