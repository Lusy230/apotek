import 'dart:io';
import 'package:apotek/view/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  File? _image;
  TextEditingController _nameController = TextEditingController(text: 'John Doe');
  TextEditingController _ageController = TextEditingController(text: '30');
  TextEditingController _genderController =
      TextEditingController(text: 'Laki-laki');

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void updateProfile() {
    setState(() {
      String name = _nameController.text;
      String age = _ageController.text;
      String gender = _genderController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Biodata berhasil diperbarui')),
      );
    });
  }

  void openWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebView(),
      ),
    );
  }

  void logout() {
    // Implement the logout logic here
    // For example, you can clear user credentials, navigate to the login page, etc.
    // Placeholder implementation: navigate to the home page for demonstration purposes.
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image != null
                  ? CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/apotek1.jpg'),
                    ),
              SizedBox(height: 20),
              Text(
                'Biodata Pengguna',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Umur'),
              ),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: updateProfile,
                    child: Text('Simpan Biodata'),
                  ),
                  ElevatedButton(
                    onPressed: openWebView,
                    child: Text('Buka Webview'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Pilih dari galeri'),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Ambil foto'),
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Edit Profil'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

