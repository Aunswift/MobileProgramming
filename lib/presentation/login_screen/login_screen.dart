import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:ahmet_s_application3/presentation/login_screen/provider/login_page_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../admin_panel/admin_panel.dart';
import '../../core/utils/image_constant.dart';
import '../clubs_screen/clubs_screen.dart';
import '../main_page_screen/main_page_screen.dart';
import '../sign_in_screen/sign_in_screen.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoC Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginPageProvider(),
        child: LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

String _errorMessage = '';
class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn => _auth.currentUser != null;

  // Giriş işlemi
  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: 'example@example.com',
        password: 'password',
      );
    } catch (e) {
      print('Giriş yaparken hata oluştu: $e');
    }
  }

  // Çıkış işlemi
  Future<void> signOut() async {
    await _auth.signOut();
  }
}


class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color _emailTextColor = Colors.white;
  Color _passwordTextColor = Colors.white;

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

  final AuthService authService = AuthService();

  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    final AuthService authService = AuthService();
    final user = _auth.currentUser;

    if (user != null) {
      if (await _isAdmin(user.uid)) {
        // Kullanıcı adminse, admin paneline yönlendir
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PostCreationPage()),
        );
      } else {
        // Kullanıcı admin değilse, herhangi bir işlem yapma
      }

    }
  }

  @override
  Widget build(BuildContext context){
    print('is user logged in?' + authService.isUserLoggedIn.toString());
    return authService.isUserLoggedIn ? _buildLoggedInForm() : _buildLoginForm();
  }

  @override
  Widget _buildLoggedInForm(){


    final AuthService authService = AuthService();
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
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No posts available.'));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data!.docs[index];
                      var baslik = post['baslik'];
                      var icerik = post['icerik'];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text('Post Detail', style: TextStyle(color: Colors.white,fontSize: 30)),
                                  centerTitle: true,
                                  backgroundColor: Colors.black54,
                                ),
                                body: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        baslik,
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      Text(
                                        icerik,
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  baslik,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    icerik,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    await signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),

                  child: Text(
                    'Log-out',
                    style: TextStyle(color: Colors.white70,
                        fontSize: 20),
                  )
              )
            ],
          ),
        ),
        )
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }



  @override
  Widget _buildLoginForm() {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoC Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50
              )),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.8),
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
            ), child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.imgBackgroundDesign),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    onChanged: (text) {
                      // Kullanıcı metin girdikçe rengi değiştir
                      setState(() {
                        _emailTextColor =
                        text.isEmpty ? Colors.black : Colors.blue;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'E-Posta',
                        labelStyle: TextStyle(color: Colors.black,
                            fontSize: 22),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.6)
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    onChanged: (text) {
                      setState(() {
                        _passwordTextColor =
                        text.isEmpty ? Colors.black : Colors.white;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _signInWithEmailAndPassword();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black12.withOpacity(0.4),
                        fixedSize: Size(180, 50)
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Don\'t you have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),

                ],
              ),
            ],
          ),
        )

        )
    );
  }

  void _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      var user = _auth.currentUser;
      if (user != null) {
        if (await _isAdmin(user.uid)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PostCreationPage()),
          );
        } else {
          // Kullanıcı admin değilse, başka bir sayfaya yönlendirin
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      }

      setState(() {
        _errorMessage = '';
      }
      );
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        print("Kullanıcının UID'si: $uid");
      } else {
        print("Oturum açmış bir kullanıcı yok.");
      }
    } catch (e) {
      print("Giriş yaparken bir hata oluştu: $e");
      setState(() {
        _errorMessage = 'Kullanıcı adı veya şifre hatalı.';
      });
    }
  }




  Future<bool> _isAdmin(String userId) async {
    var adminRef = FirebaseFirestore.instance.collection('Admins').doc(userId);
    var adminDoc = await adminRef.get();
    return adminDoc.exists;

  }
}

