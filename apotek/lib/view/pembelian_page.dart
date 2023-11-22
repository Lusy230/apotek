import 'package:apotek/controller/api_controller.dart';
import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final ApiController _apiController = ApiController();
  Map<String, dynamic> _data = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await _apiController.fetchData();
    setState(() {
      _data = data;
    });
  }

  Widget buildDataSection() {
    return _data.isEmpty
        ? CircularProgressIndicator()
        : Column(
            children: [
              Text('Data dari API:'),
              Text('$_data'), // Sesuaikan tampilan data sesuai format JSON yang diterima
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pembelian'),
      ),
      body: Center(
        child: buildDataSection(),
      ),
    );
  }
}
