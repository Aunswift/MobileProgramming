import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/custom_image_view.dart';

class EditPostScreen extends StatefulWidget {
  final DocumentSnapshot? post;

  EditPostScreen({Key? key, this.post}) : super(key: key);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
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
                              builder: (context) => PostDetailScreen(
                                baslik: baslik,
                                icerik: icerik,
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
            ],
          ),
        ),
      ),
    );
  }
}

class PostDetailScreen extends StatefulWidget {

  final String baslik;
  final String icerik;

  PostDetailScreen({required this.baslik, required this.icerik});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late TextEditingController _baslikController;
  late TextEditingController _icerikController;

  @override
  void initState() {
    super.initState();
    _baslikController = TextEditingController(text: widget.baslik);
    _icerikController = TextEditingController(text: widget.icerik);
  }

  @override
  void dispose() {
    _baslikController.dispose();
    _icerikController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Save changes to Firestore or perform any necessary actions
    FirebaseFirestore.instance.collection('posts').doc().update({
      'baslik': _baslikController.text,
      'icerik': _icerikController.text,
    });

    Navigator.pop(context); // Close the edit screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit action
                print('Edit action');
              } else if (value == 'delete') {
                // Handle delete action
                print('Delete action');
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'edit',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Düzenle'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Sil'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _baslikController,
              decoration: InputDecoration(
                labelText: 'Başlık',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _icerikController,
              decoration: InputDecoration(
                labelText: 'İçerik',
              ),
              maxLines: null, // Allow multiple lines for content
            ),
          ],
        ),
      ),
    );
  }
}
