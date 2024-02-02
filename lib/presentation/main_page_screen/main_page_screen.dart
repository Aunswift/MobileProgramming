import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../clubs_screen/clubs_screen.dart';
import '../daily_menu_screen/daily_menu_screen.dart';
import '../login_screen/login_screen.dart';
import '../academic_calendar_screen/academic_calendar_screen.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/main_page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


final String loggedInKey = 'loggedIn';

Future<void> saveLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(loggedInKey, true);
}

Future<void> clearLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(loggedInKey);
}

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(loggedInKey) ?? false;
}



void _bookedPage() async {
  final String sports = 'http://booked.agu.edu.tr/Web/index.php';

  if (await launchUrl(Uri.parse(sports))) {
    await launch(sports, universalLinksOnly: true);
  } else {
    print('Could not launch $sports');
  }
}



class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  MainPageScreenState createState() => MainPageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainPageProvider(), child: MainPageScreen());
  }
}

class MainPageScreenState extends State<MainPageScreen> {
  @override
  void initState() {
    super.initState();
  }


  User? currentUser;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBackgroundDesign,
                height: 647.v,
                width: 360.h,
                alignment: Alignment.center,
              ),
              Positioned(
                right: 30,
                  top: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }, child: IconButton(
                    icon: Icon(Icons.notifications),
                    alignment: Alignment.center,
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                  },
                    color: Colors.red,
                  ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 146.v),
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      children: [
                        _firstRaw(context),
                        SizedBox(height: 5.v),
                        _secondRaw(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstRaw(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h, right: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 250,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClubsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.1
              ),
              child: Hero(
                tag: ClubsScreen.tag, // Sayfa adını buraya ekleyin
                child: Image.asset('assets/images/clubs-on-main.png'),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailyMenuScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0.1
              ),
              child: Hero(
                tag: 'dailyMenuHeroTag', // Sayfa adını buraya ekleyin
                child: Image.asset('assets/images/daily-menu-on-main.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondRaw(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h, right: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
          height: 250,
          width: 180,
            child: ElevatedButton(
              onPressed: _bookedPage,

              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                 elevation: 0.1
              ),
              child: Hero(
                tag: 'mapsHeroTag', // Sayfa adını buraya ekleyin
                child: Image.asset('assets/images/maps-on-main.png'),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcademicCalendarPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.1
              ),
              child: Hero(
                tag: 'toDosHeroTag', // Sayfa adını buraya ekleyin
                child: Image.asset('assets/images/academic-calender-on-main.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}