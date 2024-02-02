import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../daily_menu_screen/daily_menu_screen.dart';
import '../main_page_screen/main_page_screen.dart';
import '../academic_calendar_screen/academic_calendar_screen.dart';
import 'models/clubs_model.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/clubs_provider.dart';

Future<void> _launchEmail() async {
  final Uri _emailLaunchUri = Uri(scheme: 'mailto', path: 'kulup@agu.edu.tr');
  try {
    print('Trying to launch email...');
    await launch(_emailLaunchUri.toString());
    print('Email launched successfully');
  } catch (e) {
    print('Error launching email: $e');
  }
}

void _launchIEEE() async {
  final String ieee = 'https://www.instagram.com/ieee_agu/';

  if (await launchUrl(Uri.parse(ieee))) {
    await launch(ieee, universalLinksOnly: true);
  } else {
    print('Could not launch $ieee');
  }
}

void _launchSciTech() async {
  final String scitech = 'https://www.instagram.com/agu_scitech/';

  if (await launchUrl(Uri.parse(scitech))) {
    await launch(scitech, universalLinksOnly: true);
  } else {
    print('Could not launch $scitech');
  }
}

void _launchAlumni() async {
  final String alumi = 'https://www.instagram.com/agualumniclub/';

  if (await launchUrl(Uri.parse(alumi))) {
    await launch(alumi, universalLinksOnly: true);
  } else {
    print('Could not launch $alumi');
  }
}

void _launchKultur() async {
  final String kultur = 'https://www.instagram.com/aguedebiyat/';

  if (await launchUrl(Uri.parse(kultur))) {
    await launch(kultur, universalLinksOnly: true);
  } else {
    print('Could not launch $kultur');
  }
}

void _launchPerNet() async {
  final String pernet = 'https://www.instagram.com/personal.networking/';

  if (await launchUrl(Uri.parse(pernet))) {
    await launch(pernet, universalLinksOnly: true);
  } else {
    print('Could not launch $pernet');
  }
}

void _launchTechIn() async {
  final String techin = 'https://www.instagram.com/agutechnicalinnovationclub/';

  if (await launchUrl(Uri.parse(techin))) {
    await launch(techin, universalLinksOnly: true);
  } else {
    print('Could not launch $techin');
  }
}

void _launchYapi() async {
  final String yapi = 'https://www.instagram.com/aguyapikulubu/';

  if (await launchUrl(Uri.parse(yapi))) {
    await launch(yapi, universalLinksOnly: true);
  } else {
    print('Could not launch $yapi');
  }
}

void _launchLosev() async {
  final String losev = 'https://www.instagram.com/agulosev/';

  if (await launchUrl(Uri.parse(losev))) {
    await launch(losev, universalLinksOnly: true);
  } else {
    print('Could not launch $losev');
  }
}

void _launchSWE() async {
  final String swe = 'https://www.instagram.com/swe_agu/';

  if (await launchUrl(Uri.parse(swe))) {
    await launch(swe, universalLinksOnly: true);
  } else {
    print('Could not launch $swe');
  }
}

void _launchWiB() async {
  final String wib = 'https://www.instagram.com/aguwomeninbusiness/';

  if (await launchUrl(Uri.parse(wib))) {
    await launch(wib, universalLinksOnly: true);
  } else {
    print('Could not launch $wib');
  }
}

void _launchKizilay() async {
  final String kizilay = 'https://www.instagram.com/genckizilayagu/';

  if (await launchUrl(Uri.parse(kizilay))) {
    await launch(kizilay, universalLinksOnly: true);
  } else {
    print('Could not launch $kizilay');
  }
}

void _launchCompSoc() async {
  final String compsoc = 'https://www.instagram.com/agucompsociety/';

  if (await launchUrl(Uri.parse(compsoc))) {
    await launch(compsoc, universalLinksOnly: true);
  } else {
    print('Could not launch $compsoc');
  }
}

void _launchGencTema() async {
  final String genctema = 'https://www.instagram.com/agugenctema/';

  if (await launchUrl(Uri.parse(genctema))) {
    await launch(genctema, universalLinksOnly: true);
  } else {
    print('Could not launch $genctema');
  }
}

void _launchBusiness() async {
  final String business = 'https://www.instagram.com/agubusinessclub/';

  if (await launchUrl(Uri.parse(business))) {
    await launch(business, universalLinksOnly: true);
  } else {
    print('Could not launch $business');
  }
}

void _launchGaming() async {
  final String gaming = 'https://www.instagram.com/agugamingclub/';

  if (await launchUrl(Uri.parse(gaming))) {
    await launch(gaming, universalLinksOnly: true);
  } else {
    print('Could not launch $gaming');
  }
}

void _launchYAK() async {
  final String yak = 'https://www.instagram.com/aguyak/';

  if (await launchUrl(Uri.parse(yak))) {
    await launch(yak, universalLinksOnly: true);
  } else {
    print('Could not launch $yak');
  }
}

void _launchSports() async {
  final String sports = 'https://www.instagram.com/agusportclub/';

  if (await launchUrl(Uri.parse(sports))) {
    await launch(sports, universalLinksOnly: true);
  } else {
    print('Could not launch $sports');
  }
}

void _launchIdea() async {
  final String idea = 'https://www.instagram.com/aguidc/';

  if (await launchUrl(Uri.parse(idea))) {
    await launch(idea, universalLinksOnly: true);
  } else {
    print('Could not launch $idea');
  }
}

void _launchInterAss() async {
  final String interass =
      'https://www.instagram.com/agu_international_association/';

  if (await launchUrl(Uri.parse(interass))) {
    await launch(interass, universalLinksOnly: true);
  } else {
    print('Could not launch $interass');
  }
}

void _launchAGUClubs() async {
  final String clubs = 'https://sks-tr.agu.edu.tr/ogrencikulupleri';

  if (await launchUrl(Uri.parse(clubs))) {
    await launch(clubs, universalLinksOnly: true);
  } else {
    print('Could not launch $clubs');
  }
}

void _launchAGU() async {
  final String agu = 'https://w3.agu.edu.tr/';
  if (await launchUrl(Uri.parse(agu))) {
    await launch(agu, universalLinksOnly: true);
  } else {
    print('Could not launch $agu');
  }
}


class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key})
      : super(
          key: key,
        );
  static const String tag = 'clubsHeroTag';

  @override
  ClubsScreenState createState() => ClubsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClubsProvider(),
      child: ClubsScreen(),
    );
  }
}

class ClubsScreenState extends State<ClubsScreen> {
  @override
  void initState() {
    super.initState();
  }
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MainPageScreen(),
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
        backgroundColor: appTheme.gray900,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black26.withOpacity(0.5),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book, color: Colors.white),
                label: 'Daily Menu'
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(fontSize: 20),
          unselectedLabelStyle: TextStyle(fontSize: 20)
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 17.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      right: 6.h,
                      bottom: 83.v,
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _launchEmail();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black26),
                          child: Text(
                            'If you have any questions, click here.',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 26.v),
                        _IEEERowu(context),
                        SizedBox(height: 17.v),
                        _kltrEdbRowu(context),
                        SizedBox(height: 21.v),
                        _yapiRowu(context),
                        SizedBox(height: 11.v),
                        _yakRowu(context),
                        SizedBox(height: 23.v),
                        _buildLastRow(context),
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
}

/// Section Widget
Widget _IEEERowu(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 150.v,
        width: 110.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.v,
                width: 100.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray10033,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 120.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _launchIEEE,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                      child: Text(
                        'IEEE'.tr,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgIeeAg1,
              height: 107.v,
              width: 105.h,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 150.v,
        width: 100.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgAgSciTechLogo,
              height: 110.adaptSize,
              width: 100.adaptSize,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.v,
                width: 100.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray10033,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchSciTech,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Sci-Tech',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
      SizedBox(
        height: 150.v,
        width: 100.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgAgMezunlar1,
              height: 110.adaptSize,
              width: 100.adaptSize,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.v,
                width: 100.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray10033,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchAlumni,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Alumni',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    ],
  );
}

Widget _kltrEdbRowu(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 6.h,
      right: 3.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 136.v,
          width: 100.h,
          margin: EdgeInsets.only(top: 3.v),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 135.v,
                  width: 100.h,
                  padding: EdgeInsets.all(1.h),
                  decoration: AppDecoration.fillBlueGray,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgKLtRVeEdebiyat,
                    height: 90.v,
                    width: 91.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 180.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchKultur,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Kltr. Edb.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 137.v,
          width: 94.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 150.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPernet1,
                height: 98.v,
                width: 93.h,
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _launchPerNet,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Per. Net.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150.v,
          width: 100.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 134.v,
                  width: 94.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgTechInnovation,
                height: 98.v,
                width: 93.h,
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 160.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchTechIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Tech. In.',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Section Widget
Widget _yapiRowu(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 150.v,
              width: 100.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgYapKulB1,
                    height: 110.adaptSize,
                    width: 100.adaptSize,
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150.v,
                      width: 100.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray10033,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _launchYapi,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                              ),
                              child: Text(
                                'Yapı',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 150.v,
              width: 100.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAgLSev1,
                    height: 110.adaptSize,
                    width: 100.adaptSize,
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150.v,
                      width: 100.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray10033,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _launchLosev,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                              ),
                              child: Text(
                                'Lösev',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 150.v,
              width: 100.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSweAg1,
                    height: 110.adaptSize,
                    width: 100.adaptSize,
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150.v,
                      width: 100.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray10033,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _launchSWE,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                              ),
                              child: Text(
                                'SWE',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 23.v),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 136.v,
            width: 103.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 134.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchWiB,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: Text(
                            'WiB'.tr,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgWomenInBusinnes,
                  height: 90.v,
                  width: 95.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 136.v,
            width: 103.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 134.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchKizilay,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: Text(
                            'Kızılay'.tr,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgKZLayAg1,
                  height: 95.v,
                  width: 107.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 136.v,
            width: 105.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 134.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 250.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchCompSoc,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              fixedSize: Size(100, 30)),
                          child: Text(
                            'Comp. Soc.'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgComputerSociety,
                    height: 95.v,
                    width: 107.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 11.v),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 136.v,
            width: 103.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 134.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 100.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchBusiness,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: Text(
                            'Business'.tr,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: 'assets/images/img_business_club.png',
                  height: 100.v,
                  width: 100.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 136.v,
            width: 110.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 150.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchGencTema,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                          child: Text(
                            'Genç Tema'.tr,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgGenTema1,
                  height: 95.v,
                  width: 107.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 136.v,
            width: 105.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 134.v,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10033,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 250.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _launchGaming,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              fixedSize: Size(110, 30)),
                          child: Text(
                            'Gaming Club'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGaming1,
                    height: 90.v,
                    width: 101.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

/// Section Widget
Widget _yakRowu(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 3.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 136.v,
          width: 103.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 134.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchYAK,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'YAK'.tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgYNeylemAraTRma,
                height: 80.v,
                width: 100.h,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136.v,
          width: 110.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 150.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchSports,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Sports'.tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgAgSportsClup,
                height: 80.v,
                width: 107.h,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136.v,
          width: 105.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 134.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchIdea,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            fixedSize: Size(110, 30)),
                        child: Text(
                          'Idea Camp'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CustomImageView(
                  imagePath: ImageConstant.imgIdeaCamp1,
                  height: 90.v,
                  width: 101.h,
                  alignment: Alignment.topCenter,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Common widget
Widget _buildLastRow(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 3.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 136.v,
          width: 103.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 134.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchAGUClubs,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: Text(
                          'Clubs'.tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgBackgroundDesign640x360,
                height: 90.v,
                width: 101.h,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136.v,
          width: 110.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 150.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchInterAss,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          fixedSize: Size(100, 30),
                        ),
                        child: Text(
                          'Inter. Assoc.'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgInternationalAss,
                height: 80.v,
                width: 107.h,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136.v,
          width: 105.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 134.v,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.blueGray10033,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _launchAGU,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            fixedSize: Size(110, 30)),
                        child: Text(
                          'AGU Page'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CustomImageView(
                  imagePath: ImageConstant.imgBackgroundDesign640x360,
                  height: 90.v,
                  width: 101.h,
                  alignment: Alignment.topCenter,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
