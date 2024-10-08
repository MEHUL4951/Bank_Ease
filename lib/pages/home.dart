import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name1="";
  String CustId = "";
  String account_holder = "";
  String account_no = "";
  String card_no = "";

  void setvariables() async {
    super.initState();
    final pref = await SharedPreferences.getInstance();
    name1 = pref.getString('name') ?? '';
    CustId = pref.getString('id') ?? '';
    // pref.setString('name', customerName);
    // pref.setString('id', customerId);

  }

  @override
  void initState() {
    setvariables();
  }
  bool isAccountDetailsExpanded = false;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('BankEase'),//bharat national bank
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: ()async {
              //Customer customer = await fetchuserdata();
              //Navigator.pushNamed(context, '/profile', arguments: customer);
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //Navigator.pushNamed(context, '/updateProfile');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Bharat National Bank',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Account Details'),
                onTap: () {
                  // Toggle account details
                  setState(() {
                    isAccountDetailsExpanded = !isAccountDetailsExpanded;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Transaction History'),
                onTap: () {
                  // Navigate to transaction history page
                  //Navigator.pushNamed(context, '/transactionHistory');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Account Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: isAccountDetailsExpanded ? Icon(
                          Icons.keyboard_arrow_up,
                          key: Key('up'),
                        )
                            : Icon(
                          Icons.keyboard_arrow_down,
                          key: Key('down'),
                        ),
                      ),
                      onTap: () {
                        // Toggle account details
                        setState(() {
                          isAccountDetailsExpanded = !isAccountDetailsExpanded;
                        });
                      },
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: isAccountDetailsExpanded ? 300 : 0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Text('Account Holder'),
                              //subtitle: Text(customer_info.name.toString()),
                              subtitle: Text("Mahek Garala"),
                            ),
                            ListTile(
                              leading: Icon(Icons.account_balance),
                              title: Text('Account Number'),
                              //subtitle: Text(account_info.account_no.toString()),
                              subtitle: Text("123456789"),
                            ),
                            ListTile(
                              leading: Icon(Icons.credit_card),
                              title: Text('Card Number'),
                              //subtitle: Text(account_info.debit_card_no.toString()),
                              subtitle: Text("1400025000"),
                            ),
                            ListTile(
                              leading: Icon(Icons.currency_rupee_rounded),
                              title: Text('Balance'),
                              //subtitle: Text(account_info.balance.toString()),
                              subtitle: Text("20/-"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/genrate_qr');
                    // Add transfer money functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(185.0, 35.0),
                    backgroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.qr_code),
                  label: Text('QR Code'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/scan_qr');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.0, 35.0),
                    backgroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.qr_code_scanner),
                  label: Text('Scan & Pay'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {

                    //Navigator.pushNamed(context, '/transaction');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(185.0, 35.0),
                    backgroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.send),
                  label: Text('Transfer Money'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.0, 35.0),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/transactionHistory');
                  },
                  icon: Icon(Icons.history),
                  label: Text('Transaction History'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}