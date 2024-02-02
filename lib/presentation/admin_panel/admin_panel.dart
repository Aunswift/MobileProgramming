import 'package:ahmet_s_application3/presentation/main_page_screen/main_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../../core/utils/image_constant.dart';
import '../post_list_page/post_list_page.dart';

class PostCreationPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _baslikController = TextEditingController();
  final TextEditingController _icerikController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const int sessionTimeoutDuration = 800;
    Timer? sessionTimer;
    void startSessionTimer() {
      sessionTimer = Timer(Duration(seconds: sessionTimeoutDuration), () {

        signOut();
      }
      );
    }

    void resetSessionTimer() {
      sessionTimer?.cancel();
      startSessionTimer(); // Y
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Page',
          style: TextStyle(color: Colors.white60),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.imgBackgroundDesign),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _baslikController,
                onTap: resetSessionTimer,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        color: Colors.black, fontSize: 20),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6)),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _icerikController,
                onTap: resetSessionTimer,
                decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(
                        color: Colors.black, fontSize: 20),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.6)),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _createPost(context);
                  resetSessionTimer();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7)),
                child: Text(
                  'Gönderi Oluştur',
                  style: TextStyle(color: Colors.white70,
                    fontSize: 24
                  )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPostScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.7),
                ),
                child: Text(
                  'Gönderileri Görüntüle',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                child: ElevatedButton(
                onPressed: () async {
                  await signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPageScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                  fixedSize: Size(10,20)
                ),

                child: Text(
                    'Log-out',
                    style: TextStyle(color: Colors.white70,
                    fontSize: 20),
                )
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void _createPost(BuildContext context) async {
    var user = _auth.currentUser;
    if (user != null) {
      String baslik = _baslikController.text.trim();
      String icerik = _icerikController.text.trim();

      if (baslik.isNotEmpty && icerik.isNotEmpty) {
        await _firestore.collection('posts').add({
          'baslik': baslik,
          'icerik': icerik,
          'userId': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gönderi başarıyla oluşturuldu')),
        );

        _baslikController.clear();
        _icerikController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Başlık ve gönderi alanları boş olamaz')),
        );
      }
    }
  }
}
