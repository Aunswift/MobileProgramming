import 'package:url_launcher/url_launcher.dart';
import '../clubs_screen/clubs_screen.dart';
import '../main_page_screen/main_page_screen.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/daily_menu_provider.dart';




void _launchYapikredi() async {
  const String yapikredi = 'https://play.google.com/store/apps/details?id=com.ykb.android';
  if (await launchUrl(Uri.parse(yapikredi))) {
    await launch(yapikredi, universalLinksOnly: true);
  } else {
    print('Could not launch $yapikredi');
  }
}

class DailyMenuScreen extends StatefulWidget {
  const DailyMenuScreen({Key? key})
      : super(
          key: key,
        );
  @override
  DailyMenuScreenState createState() => DailyMenuScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DailyMenuProvider(),
      child: DailyMenuScreen(),
    );
  }
}

class DailyMenuScreenState extends State<DailyMenuScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MainPageScreen(),
    ClubsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[_selectedIndex]),
    );
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black26.withOpacity(0.8),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports, color: Colors.white),
                  label: 'Clubs'
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontSize: 20),
            unselectedLabelStyle: TextStyle(fontSize: 20)
        ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/images/img_background_design_640x360.png',
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0*fem,
              top: 90*fem,
              child: Align(
                child: SizedBox(
                  width: 359*fem,
                  height: 434*fem,
                  child: Image.asset(
                    'assets/images/yemek-menu.png',
                    width: 359*fem,
                    height: 500*fem,

                  ),
                ),
              ),
            ),
        Positioned(
          left: 5*fem,
          top: 530*fem,
          child: ElevatedButton(
          onPressed: _launchYapikredi,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(400,100),
            backgroundColor: Colors.white.withOpacity(0.3),
            shadowColor: Colors.black.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),

            ),
          ),
              child: Align(
                child: SizedBox(
                  width: 362.88*fem,
                  height: 187*fem,
                  child: Image.asset(
                    'assets/images/yapikredi.png',
                    width: 362.88*fem,
                    height: 187*fem,
                  ),
                ),
              ),
            ),
        )
          ],
        ),
      ),
    ),
    );
  }
}