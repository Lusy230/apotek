import 'package:flutter/material.dart';

class HistoriPage extends StatelessWidget {
  final List<String> historyList = [
    'Pembelian 1',
    'Pembayaran 1',
    'Pembelian 2',
    'Pembayaran 2',
    'Pembelian 3',
    'Pembayaran 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Histori'),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(historyList[index]),
          );
        },
      ),
    );
  }
}