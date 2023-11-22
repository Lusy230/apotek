import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
 final List<String> selectedItems;
 final List<String> prices;
 final String voucherUsed;
 final String totalAmount;

 CheckOutPage({
    required this.selectedItems,
    required this.prices,
    required this.voucherUsed,
    required this.totalAmount,
 });

 @override
 _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
 String? _selectedPaymentMethod;
 bool _isLoading = false;

 void _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    // Simulasi pengiriman data dan pembayaran
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembayaran'),
          content: Text('Apakah Anda yakin untuk melakukan pembayaran ini?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Konfirmasi'),
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                 context: context,
                 builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Berhasil'),
                      content: Text('Pembayaran berhasil dilakukan.'),
                      actions: [
                        TextButton(
                          child: Text('Oke'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                 },
                );
              },
            ),
          ],
        );
      },
    );
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                    'Items:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                 ),
                 SizedBox(height: 10),
                 Column(
                    children: widget.selectedItems.map((item) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item),
                          Text('Rp${widget.prices[widget.selectedItems.indexOf(item)]}'),
                        ],
                      );
                    }).toList(),
                 ),
                 SizedBox(height: 20),
                 Text(
                    'Total Harga: Rp${widget.totalAmount}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                 ),
                 SizedBox(height: 20),
                 widget.voucherUsed.isNotEmpty
                      ? Text(
                          'Voucher yang Digunakan: ${widget.voucherUsed}',
                          style: TextStyle(fontSize: 16),
                        )
                      : Container(),
                 SizedBox(height: 20),
                 Text(
                    'Metode Pembayaran:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                 ),
                 SizedBox(height: 10),
                 Column(
                    children: [
                      ListTile(
                        title: Text('OVO'),
                        trailing: Radio(
                          value: 'OVO',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value as String;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Bank Transfer'),
                        trailing: Radio(
                          value: 'Bank Transfer',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value as String;
                            });
                          },
                        ),
                      ),
                    ],
                 ),
                 SizedBox(height: 20),
                 ElevatedButton(
                   onPressed: _selectedPaymentMethod == null ? null : _submitForm,
                   child: Text('Bayar'),
                 ),
                ],
              ),
            ),
    );
 }
}
