import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'checkout_page.dart';

class KeranjangPage extends StatefulWidget {
  final List<String> selectedItems;
  final List<String> prices;

  KeranjangPage({required this.selectedItems, required this.prices});

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(widget.selectedItems.length, false);
  }

  void toggleCheckbox(bool value, int index) {
    setState(() {
      isCheckedList[index] = value;
    });
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.fda.gov/drug/event.json?search=patient.drug.openfda.pharm_class_epc:"nonsteroidal+anti-inflammatory+drug"&limit=1'));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var data = json.decode(response.body);
      print(data); // Use the data as required
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data from API');
    }
  }

  void navigateToCheckOutPage(BuildContext context) async {
    await fetchData(); // Fetch API data before navigating to the checkout page

    if (widget.selectedItems.length != widget.prices.length) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Length of selectedItems and prices is different.'),
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
    } else {
      List<bool> selectedItems = isCheckedList;
      List<String> selectedItemsString =
          selectedItems.map((item) => item.toString()).toList();
      String isVoucherUsed = ''; // add logic to determine if voucher is used
      String totalAmount = ''; // add logic to determine the total amount

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckOutPage(
            selectedItems: selectedItemsString,
            prices: widget.prices,
            voucherUsed: isVoucherUsed,
            totalAmount: totalAmount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: widget.selectedItems.isEmpty
          ? Center(
              child: Text('Keranjang kosong'),
            )
          : ListView.builder(
              itemCount: widget.selectedItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                    value: isCheckedList[index],
                    onChanged: (value) {
                      toggleCheckbox(value!, index);
                    },
                  ),
                  title: Text(widget.selectedItems[index]),
                  subtitle: Text(widget.prices[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Implementasi edit
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Implementasi hapus
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          navigateToCheckOutPage(context);
        },
        child: Text('Check Out'),
      ),
    );
  }
}
