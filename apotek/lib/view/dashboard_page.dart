import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 2, 55, 64), // Pastel green color for the header
      ),
      backgroundColor: Color.fromARGB(255, 28, 118, 143), // Background color is a pastel green
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Pembelian'),
              onTap: () {
                // Navigasi ke halaman Pembelian
                Navigator.pushNamed(context, '/pembelian');
              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_num),
              title: Text('Voucher'),
              onTap: () {
                // Navigasi ke halaman Voucher
                Navigator.pushNamed(context, '/voucher');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histori'),
              onTap: () {
                // Navigasi ke halaman Histori
                Navigator.pushNamed(context, '/histori');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Navigasi ke halaman Profil
                Navigator.pushNamed(context, '/akun');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Dashboard!',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 98, 131), // Pink pastel color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman Pembelian
                      Navigator.pushNamed(context, '/pembelian');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, size: 50),
                        Text('Pembelian'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 95, 247), // Purple pastel color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman Histori
                      Navigator.pushNamed(context, '/histori');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 50),
                        Text('Histori'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 141, 76), // Orange pastel color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman Profil
                      Navigator.pushNamed(context, '/akun');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 50),
                        Text('Profil'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 99, 182, 237), // Light blue pastel color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman Voucher
                      Navigator.pushNamed(context, '/voucher');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.confirmation_num, size: 50),
                        Text('Voucher'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
