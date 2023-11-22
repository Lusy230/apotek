import 'package:apotek/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text('Home'),
actions: [
IconButton(
icon: Icon(Icons.exit_to_app),
onPressed: () {
_authController.logout();
},
),
],
),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/apotek3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pharmacy & Drug Store',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Market',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Menyediakan obat, alat kesehatan serta perbekalan kefarmasian yang berkualitas dan terjangkau oleh masyarakat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman LogInPage
                  Navigator.pushNamed(context, '/logIn');
                },
                child: Text('Log In'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigasi ke halaman SignInPage
                  Navigator.pushNamed(context, '/signIn');
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}