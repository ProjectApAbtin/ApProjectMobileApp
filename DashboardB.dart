import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double _balance = 250.0;
  TextEditingController _amountController = TextEditingController();
  List<String> _purchases = [    'FT001', 'HT002', 'TT003'  ];

  void _chargeWallet() {
    double amount = double.parse(_amountController.text);
    setState(() {
      _balance += amount;
    });
    _amountController.clear();
  }

  void _viewPurchase(String code) {
    String title;
    if (code.startsWith('FT')) {
      title = 'Flight Ticket Details';
    } else if (code.startsWith('HT')) {
      title = 'Hotel Details';
    } else if (code.startsWith('TT')) {
      title = 'Train Ticket Details';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Trip"),
          content: Text('Purchase Code: $code'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
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
        backgroundColor: Colors.deepOrange,
        title: Text('My Wallet'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Balance',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              '\$${_balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Text(
              'Last Purchases',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: _purchases.length,
                itemBuilder: (BuildContext context, int index) {
                  String purchaseCode = _purchases[index];
                  String purchaseType;
                  IconData purchaseIcon;
                  if (purchaseCode.startsWith('FT')) {
                    purchaseType = 'Flight Ticket';
                    purchaseIcon = Icons.flight;
                  } else if (purchaseCode.startsWith('HT')) {
                    purchaseType = 'Hotel';
                    purchaseIcon = Icons.hotel;
                  } else if (purchaseCode.startsWith('TT')) {
                    purchaseType = 'Train Ticket';
                    purchaseIcon = Icons.train;
                  }
                  return ListTile(
                    leading: Icon(Icons.trip_origin, color: Colors.orangeAccent),
                    title: Text(
                      "Purchase",
                      style: TextStyle(color: Colors.green),
                    ),
                    subtitle: Text(
                    purchaseCode,
                    style: TextStyle(color: Colors.green),
                  ),
                  trailing: GestureDetector(
                  onTap: () {
                  _viewPurchase(purchaseCode);
                  },
                  child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.blue),
                  ),
                  ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount to Charge',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _chargeWallet();
              },
              child: Text('Charge My Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}
