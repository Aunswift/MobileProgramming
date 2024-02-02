import 'package:ahmet_s_application3/presentation/clubs_screen/clubs_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/image_constant.dart';
import '../login_screen/login_screen.dart';
import '../main_page_screen/main_page_screen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Register to LoC',style: TextStyle(
            color: Colors.white,
            fontSize: 30
        )),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.8)
      ),
    bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball),
          label: 'Clubs'
        )
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
    height: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(ImageConstant.imgBackgroundDesign),
    fit: BoxFit.cover,
    ),
    ), child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'E-Posta',
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 22),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 22),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.6)),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _registerWithEmailAndPassword();
              },
              child: Text(
                  'Sign-in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54
              ),
            ),
            SizedBox(height: 20),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
    );
  }

  void _registerWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Başarılı kayıt durumunda SnackBar göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Başarıyla kayıt olundu!"),
          duration: Duration(seconds: 2), // Opsiyonel: Mesajın ne kadar süre gösterileceği
        ),
      );

      // Hata mesajını temizle
      setState(() {
        _errorMessage = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      print("Kayıt olma sırasında bir hata oluştu: $e");
      if (e is FirebaseAuthException) {
        // FirebaseAuthException tipinde bir hata olduğunda özel mesajları ayarla
        setState(() {
          if (e.code == 'email-already-in-use') {
            _errorMessage = 'Bu e-posta adresi zaten kullanımda. Giriş sayfasına yönlendiriliyorsunuz.';
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          } else if (e.code == 'weak-password') {
            _errorMessage = 'Güçsüz şifre. 6 karakterden uzun ve daha güçlü bir şifre seçin.';
          } else {
            _errorMessage = 'Kayıt başarısız. Hata kodu: ${(e as FirebaseAuthException).code}';
          }
        });
      } else {
        // FirebaseAuthException dışında bir hata olduğunda genel bir mesaj göster
        setState(() {
          _errorMessage = 'Kayıt olurken bir hata oluştu: $e';
        });
      };
    }
  }
}
