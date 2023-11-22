import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  final List<String> vouchers = ['Voucher A', 'Voucher B', 'Voucher C', 'Voucher D'];

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
        title: Text('Voucher'),
      ),
      body: ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(vouchers[index]),
            trailing: ElevatedButton(
              onPressed: () {
                // Implementasi penggunaan voucher
              },
              child: Text('Gunakan'),
            ),
          );
        },
      ),
    );
  }
}