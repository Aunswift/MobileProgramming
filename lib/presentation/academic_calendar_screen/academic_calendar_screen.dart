import 'package:ahmet_s_application3/presentation/clubs_screen/clubs_screen.dart';
import 'package:ahmet_s_application3/presentation/daily_menu_screen/daily_menu_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main_page_screen/main_page_screen.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/academic_calendar_provider.dart';

void _launchLisans() async {
  final String lisans =
      'https://oidb-tr.agu.edu.tr/uploads/akademik_takvim/Akademik%20Takvim%20%2823-24%29%20%285%29.pdf';

  if (await launchUrl(Uri.parse(lisans))) {
    await launch(lisans, universalLinksOnly: true);
  } else {
    print('Could not launch $lisans');
  }
}

void _launchPrep() async {
  final String prep =
      'https://oidb-tr.agu.edu.tr/uploads/akademik_takvim/Akademik%20Takvim%20Haz%C4%B1rl%C4%B1k%20%2823-24%29%20%284%29.pdf';

  if (await launchUrl(Uri.parse(prep))) {
    await launch(prep, universalLinksOnly: true);
  } else {
    print('Could not launch $prep');
  }
}

class AcademicCalendarPage extends StatefulWidget {
  const AcademicCalendarPage({Key? key})
      : super(
          key: key,
        );

  @override
  ToDosScreenState createState() => ToDosScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AcademicCalendarProvider(),
      child: AcademicCalendarPage(),
    );
  }
}

class ToDosScreenState extends State<AcademicCalendarPage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MainPageScreen(),
    ClubsScreen(),
    DailyMenuScreen(),
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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black26.withOpacity(0.8),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports, color: Colors.white),
                  label: 'Clubs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: 'Menu')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontSize: 20),
            unselectedLabelStyle: TextStyle(fontSize: 20)),
        body: Container(
          width: 1440,
          height: 3120,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgBackgroundDesign640x360),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 250),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        60),
                  ),
                ),
                onPressed: _launchLisans,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Licance Academic Calender',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 195,
                child: Image(image: AssetImage('assets/images/agu_logo.png')),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  fixedSize: Size(250, 250),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
                onPressed: _launchLisans,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Prep. School Academic Calendar',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
