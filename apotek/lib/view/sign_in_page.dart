import 'package:flutter/material.dart';
import 'login_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tempat, Tanggal Lahir'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Jenis Kelamin'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Masukkan Kembali Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Berhasil Mendaftar'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman LogInPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Log In Instead'),
            ),
          ],
        ),
      ),
    );
  }
}